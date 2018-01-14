import math
from itertools import chain

from django.shortcuts import render, redirect, HttpResponse
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import login as django_login
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.core.urlresolvers import reverse
from django.views.generic import DetailView, FormView, UpdateView
from django.conf import settings

from haystack.query import SearchQuerySet

from .models import Posts, PostTags, Tag
from .forms import PostsForm, TagsForm, SearchForm


def word_cloud():
    post_tags = PostTags.posts_in_tags_queryset()
    result = []

    if post_tags:
        maximum = max(list(chain(*post_tags.values_list('posts'))))

        for obj in post_tags.iterator():
            percent = math.floor((obj['posts'] * 100) / maximum)
            if percent <= 60:
                obj['css_class'] = 'tag-cloud_small'
            elif 60 < percent <= 80:
                obj['css_class'] = 'tag-cloud_medium'
            else:
                obj['css_class'] = 'tag-cloud_large'
            result.append(obj)
    return result


def custom_login(request):
    if request.user.is_authenticated():
        return redirect(settings.LOGIN_REDIRECT_URL)
    return django_login(request)


def pagination(request, object_list):
    # show 7 posts per page
    paginator = Paginator(object_list, 6)
    page = request.GET.get('page')

    try:
        pages = paginator.page(page)
    except PageNotAnInteger:
        # if page is not an integer, deliver first page.
        pages = paginator.page(1)
    except EmptyPage:
        # if page is out of range (e.g. 9999), deliver
        # last page of results.
        pages = paginator.page(paginator.num_pages)
    return pages


@login_required
def index(request):
    """
    Returns all posts ordered by date of creation (new post first)

    :param request:  a get request
    """
    post_list = Posts.objects.order_by('-date_created').filter(status=2)
    posts = pagination(request, post_list)

    context = {'tags': word_cloud(), 'posts': posts}
    return render(request, 'blog/index.html', context)


@login_required
def posts_in_tag(request, tag_slug):
    post_list = Posts.objects.get_posts_in_tag(tag_slug)\
                             .order_by('-date_created')\
                             .filter(status=2)
    posts = pagination(request, post_list)
    context = {'tags': word_cloud(), 'posts': posts}

    return render(request, 'blog/posts_in_tag.html', context)


def post_search(request):
    form = SearchForm()

    if 'query' in request.GET:
        form = SearchForm(request.GET)
        if form.is_valid():
            cd = form.cleaned_data
            results = SearchQuerySet().models(Posts).filter(content=cd['query']).load_all()

            # count total results
            total_results = results.count()
            return render(request,
                          'search/search.html',
                          {'form': form,
                           'tags': word_cloud(),
                           'cd': cd,
                           'results': results,
                           'total_results': total_results})
        else:
            return render(request, 'search/search.html', {'form': form})
    return render(request, 'search/search.html', {'form': form})


class ViewPost(LoginRequiredMixin, DetailView):
    model = Posts
    template_name = 'blog/post_detail.html'

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()
        context = self.get_context_data(
            post=self.object,
            tags=word_cloud()
        )
        return self.render_to_response(context)


class NewPost(LoginRequiredMixin, FormView):
    template_name = 'blog/post_new.html'
    form_class = PostsForm
    success_url = None


    def form_valid(self, form):
        tags = form.cleaned_data['tags']
        post = form.save(commit=False)
        post.save()

        for tag in tags:
            PostTags.objects.create(post=post, tag=tag)

        self.success_url = reverse('blog:view-post', kwargs={'slug': post.slug})
        return super(NewPost, self).form_valid(form)

    def form_invalid(self, form):
        return super(NewPost, self).form_invalid(form)


class NewTag(LoginRequiredMixin, FormView):
    form_class = TagsForm
    success_url = "/"
    template_name = "blog/tag_new.html"

    def form_valid(self, form):
        form.save()
        return super(NewTag, self).form_valid(form)

    def form_invalid(self, form):
        return super(NewTag, self).form_invalid(form)


class NewTagPopUp(LoginRequiredMixin, FormView):
    form_class = TagsForm
    template_name = "blog/tag_popup.html"

    def form_valid(self, form):
        tag_name = form.cleaned_data["name"]
        tag_obj = Tag(name=tag_name)
        tag_obj.save()
        return handle_pop_add(tag_obj)

    def form_invalid(self, form):
        return super(NewTagPopUp, self).form_invalid(form)


def handle_pop_add(new_object):
    dismiss_popup = ('<script type="text/javascript">'
                     'opener.dismissAddAnotherPopup(window, "{}", "{}");'
                     '</script>'.format(new_object._get_pk_val(), new_object))
    return HttpResponse(dismiss_popup)


class EditPost(LoginRequiredMixin, UpdateView):
    model = Posts
    template_name = 'blog/post_edit.html'
    form_class = PostsForm

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()
        form_class = self.get_form_class()
        form = self.get_form(form_class)
        return self.render_to_response(self.get_context_data(form=form))

    def post(self, request, *args, **kwargs):
        self.object = self.get_object()
        form_class = self.get_form_class()
        form = self.get_form(form_class)

        if form.is_valid():
            tags = form.cleaned_data['tags']
            post = form.save(commit=False)
            post.save()

            post.tags.clear()
            for tag in tags:
                PostTags.objects.create(post=post, tag=tag)
            return redirect('blog:view-post', slug=post.slug)
        else:
            return self.form_invalid(form)

    def form_invalid(self, form):
        return self.render_to_response(self.get_context_data(form=form))

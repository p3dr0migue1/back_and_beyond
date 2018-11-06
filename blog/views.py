from django.conf import settings
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.views import login as django_login
from django.core.urlresolvers import reverse
from django.http import Http404
from django.shortcuts import HttpResponse, redirect, render
from django.views.generic import DetailView, FormView, ListView, UpdateView
from django.views.generic.edit import ModelFormMixin

from haystack.query import SearchQuerySet

from .forms import PostsForm, SearchForm, TagsForm
from .models import Posts, Tag
from .services import PostService, PostTagsService
from .utils import StaffUserMixin, pagination


def custom_login(request):
    if request.user.is_authenticated():
        return redirect(settings.LOGIN_REDIRECT_URL)
    return django_login(request)


def post_search(request):
    form = SearchForm()

    if 'query' in request.GET:
        form = SearchForm(request.GET)
        if form.is_valid():
            cd = form.cleaned_data
            results = SearchQuerySet().models(Posts)\
                                      .filter(content=cd['query'])\
                                      .load_all()

            # count total results
            total_results = results.count()
            return render(request,
                          'search/search.html',
                          {'form': form,
                           'tags': PostTagsService.tags_in_published_posts(),
                           'cd': cd,
                           'results': results,
                           'total_results': total_results})
        else:
            return render(request, 'search/search.html', {'form': form})
    return render(request, 'search/search.html', {'form': form})


class PostCreate(LoginRequiredMixin, StaffUserMixin, FormView):
    template_name = 'blog/post_new.html'
    form_class = PostsForm
    success_url = None

    def form_valid(self, form):
        tags = form.cleaned_data['tags']
        post = form.save(commit=False)
        post.save()

        for tag in tags:
            PostTagsService.create(post, tag)

        self.success_url = reverse(
            'blog:view-post',
            kwargs={'slug': post.slug}
        )
        return super().form_valid(form)

    def form_invalid(self, form):
        return super().form_invalid(form)


class PostDetail(LoginRequiredMixin, DetailView):
    model = Posts
    template_name = 'blog/post_detail.html'

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()
        # [4, 5, 6]
        post_tags_ids = self.object.tags.values_list('id', flat=True)
        service = PostService()
        similar_posts = service.similar_posts(post_tags_ids, self.object.id)

        context = self.get_context_data(
            staff_user=request.user.is_staff,
            post=self.object,
            similar_posts=similar_posts,
            tags=PostTagsService.tags_in_published_posts()
        )
        return self.render_to_response(context)


class PostList(LoginRequiredMixin, ListView):
    model = Posts
    paginate_by = 7
    template_name = 'blog/index.html'

    def get_context_data(self, **kwargs):
        queryset = kwargs.pop('object_list', self.object_list)
        page_size = self.get_paginate_by(queryset)
        context = {
            'paginator': None,
            'page_obj': None,
            'is_paginated': False,
            'posts': None,
            'tags': None,
            'staff_user': self.request.user.is_staff,
        }

        if page_size:
            paginator, page, queryset, is_paginated = self.paginate_queryset(
                queryset,
                page_size
            )
            context['paginator'] = paginator
            context['page_obj'] = page
            context['is_paginated'] = is_paginated
            context['posts'] = queryset
            context['tags'] = PostTagsService.tags_in_published_posts()

        return super().get_context_data(**context)

    def get_queryset(self):
        if self.request.user.is_staff:
            queryset = PostService.order_by('-date_created', is_staff=True)
        else:
            queryset = PostService.order_by('-date_created')
        return queryset


class PostUpdate(LoginRequiredMixin, StaffUserMixin, UpdateView):
    form_class = PostsForm
    model = Posts
    success_url = None
    template_name = 'blog/post_edit.html'

    def form_valid(self, form):
        tags = form.cleaned_data['tags']
        post = form.save(commit=False)
        post.save()
        post.tags.clear()

        for tag in tags:
            PostTagsService.create(post, tag)

        self.success_url = reverse(
            'blog:view-post',
            kwargs={'slug': post.slug}
        )
        return super(ModelFormMixin, self).form_valid(form)

    def form_invalid(self, form):
        return self.render_to_response(self.get_context_data(form=form))


class PostsInTag(LoginRequiredMixin, DetailView):
    model = Posts
    paginate_by = 7
    slug_url_kwarg = 'tag_slug'
    template_name = 'blog/posts_in_tag.html'

    def get_context_data(self, **kwargs):
        queryset = self.object
        page_number = self.request.GET.get('page') or 1
        paginator, page, queryset, is_paginated = pagination(
            queryset,
            self.paginate_by,
            page_number,
        )
        context = {
            'paginator': paginator,
            'page_obj': page,
            'is_paginated': is_paginated,
            'posts': queryset,
            'staff_user': self.request.user.is_staff,
            'tags': PostTagsService.tags_in_published_posts(),
        }

        return super().get_context_data(**context)

    def get_object(self, queryset=None):
        tag_slug = self.kwargs.get(self.slug_url_kwarg)

        try:
            obj = PostService.get_posts_in_tag(tag_slug)
        except Posts.DoesNotExist:
            raise Http404
        return obj


class TagCreate(LoginRequiredMixin, StaffUserMixin, FormView):
    form_class = TagsForm
    success_url = "/"
    template_name = "blog/tag_new.html"

    def form_valid(self, form):
        form.save()
        return super().form_valid(form)

    def form_invalid(self, form):
        return super().form_invalid(form)


class TagCreatePopUp(LoginRequiredMixin, StaffUserMixin, FormView):
    form_class = TagsForm
    template_name = "blog/tag_popup.html"

    def form_valid(self, form):
        tag_name = form.cleaned_data["name"]
        tag_obj = Tag(name=tag_name)
        tag_obj.save()
        return handle_pop_add(tag_obj)

    def form_invalid(self, form):
        return super().form_invalid(form)


def handle_pop_add(new_object):
    dismiss_popup = ('<script type="text/javascript">'
                     'opener.dismissAddAnotherPopup(window, "{}", "{}");'
                     '</script>'.format(new_object._get_pk_val(), new_object))
    return HttpResponse(dismiss_popup)

from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import login as django_login
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.views.generic import DetailView
from django.conf import settings


from .models import Posts, PostTags


def get_associated_tags():
    return PostTags.get_tags_associated_with_posts()


def custom_login(request):
    if request.user.is_authenticated():
        return redirect(settings.LOGIN_REDIRECT_URL)
    return django_login(request)


def pagination(request, object_list):
    # show 7 posts per page
    paginator = Paginator(object_list, 7)
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

    context = {'tags': get_associated_tags(), 'posts': posts}

    return render(request, 'blog/index.html', context)


@login_required
def posts_in_tag(request, tag_slug):
    post_list = Posts.get_posts_in_tag(tag_slug)\
                     .order_by('-date_created')\
                     .filter(status=2)
    posts = pagination(request, post_list)
    context = {'tags': get_associated_tags(), 'posts': posts}

    return render(request, 'blog/posts_in_tag.html', context)


class ViewPost(LoginRequiredMixin, DetailView):
    model = Posts
    template_name = 'blog/post_detail.html'

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()
        context = self.get_context_data(
            post=self.object,
            tags=get_associated_tags()
        )
        return self.render_to_response(context)

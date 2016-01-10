from django.shortcuts import render

from .models import Posts, PostTags


def get_associated_tags():
    return PostTags.get_tags_associated_with_posts()


def index(request):
    """
    Returns all posts ordered by date of creation (new post first)

    :param request:  a get request
    """
    posts = Posts.objects.order_by('-date_created').filter(status=2)
    context = {'tags': get_associated_tags(), 'posts': posts}

    return render(request, 'blog/index.html', context)

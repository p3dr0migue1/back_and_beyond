from django.conf.urls import url
from django.contrib.auth import views as auth_views

from .views import (
    NewPost,
    NewTag,
    NewTagPopUp,
    PostDetail,
    PostList,
    PostUpdate,
    custom_login,
    post_search,
    posts_in_tag,
)


app_name = "blog"
urlpatterns = [
    url(r"^$", PostList.as_view(), name="index"),

    url(r"^login/$", custom_login, name="login"),
    url(r"^logout/$", auth_views.logout_then_login, name="logout"),

    url(r"^new-post/$", NewPost.as_view(), name="new-post"),
    url(r"^new-tag/$", NewTag.as_view(), name="new-tag"),
    url(r"^new-tag/popup/$", NewTagPopUp.as_view(), name="new-tag-popup"),
    url(r"^post/(?P<slug>[\w\-]+)/$", PostDetail.as_view(), name="view-post"),
    url(r"^post/edit/(?P<pk>[0-9]+)/$", PostUpdate.as_view(), name="edit-post"),
    url(r"^search/$", post_search, name='post_search'),
    url(r"^tag/(?P<tag_slug>[\w\-]+)/$", posts_in_tag, name="posts_in_tag"),
]

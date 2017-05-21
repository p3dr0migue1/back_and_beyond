from django.conf.urls import url
from django.contrib.auth import views as auth_views

from .views import (index, posts_in_tag, custom_login, ViewPost,
                    NewPost, EditPost, NewTag, NewTagPopUp,
                    AivaCountDown)


app_name = "blog"
urlpatterns = [
    url(r"^$", index, name="index"),
    url(r"^tag/(?P<tag_slug>[\w\-]+)/$",
        posts_in_tag, name="posts_in_tag"),

    url(r"^new-post/$", NewPost.as_view(), name="new-post"),
    url(r"^new-tag/$", NewTag.as_view(), name="new-tag"),
    url(r"^new-tag/popup/$", NewTagPopUp.as_view(), name="new-tag-popup"),
    url(r"^post/(?P<slug>[\w\-]+)/$", ViewPost.as_view(), name="view-post"),
    url(r"^post/edit/(?P<pk>[0-9]+)/$", EditPost.as_view(), name="edit-post"),

    url(r"^mana_maza/$", AivaCountDown.as_view(), name="aiva_countdown"),

    url(r"^login/$", custom_login, name="login"),
    url(r"^logout/$", auth_views.logout_then_login, name="logout")
]

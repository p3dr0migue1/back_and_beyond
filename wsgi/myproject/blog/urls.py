from django.conf.urls import url
from django.contrib.auth import views as auth_views

from . import views


app_name = 'blog'
urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(
        r'^tags/(?P<tag_slug>[\w\-]+)/$',
        views.posts_in_tag,
        name='posts_in_tag'
    ),
    url(r'^login/$', views.custom_login, name='login'),
    url(r'^logout/$', auth_views.logout_then_login, name='logout')
]

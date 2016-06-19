from django.conf.urls import url
from django.contrib.auth import views as auth_views

from .views import index, posts_in_tag, custom_login, ViewPost


app_name = 'blog'
urlpatterns = [
    url(r'^$', index, name='index'),
    url(r'^tag/(?P<tag_slug>[\w\-]+)/$',
        posts_in_tag, name='posts_in_tag'
        ),
    url(r'^post/(?P<slug>[\w\-]+)/$',
        ViewPost.as_view(), name="view-post"
        ),
    url(r'^login/$', custom_login, name='login'),
    url(r'^logout/$', auth_views.logout_then_login, name='logout')
]

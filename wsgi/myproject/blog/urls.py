from django.conf.urls import url

from . import views


app_name = 'blog'
urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^(?P<tag_slug>[\w\-]+)$', views.posts_in_tag, name='posts_in_tag')
]

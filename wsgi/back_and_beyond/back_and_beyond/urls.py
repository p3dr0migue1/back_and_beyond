from django.conf.urls import include, url
from django.contrib import admin


urlpatterns = [
    url(r'^', include('blog.urls', namespace='blog')),
    url(r'^notifications/', include('notifications.urls', namespace='notifications')),
    url(r'^admin/', include(admin.site.urls)),  # admin site
]

from django.conf import settings
from django.conf.urls import include, url
from django.conf.urls.static import static
from django.contrib import admin


urlpatterns = [
    url(r'^', include('blog.urls', namespace='blog')),
    url(r'^notifications/', include('notifications.urls', namespace='notifications')),
    url(r'^admin/', include(admin.site.urls)),  # admin site
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

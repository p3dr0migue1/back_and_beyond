from django.conf.urls import url
from django.contrib.auth import views as auth_views

from .views import NotificationsView


app_name = "notifications"
urlpatterns = [
    url(r"^$", NotificationsView.as_view(), name="index"),
]

from django.contrib import admin
from .models import Notifications


class NotificationsAdmin(admin.ModelAdmin):
    list_display = ('title', 'message')

admin.site.register(Notifications, NotificationsAdmin)

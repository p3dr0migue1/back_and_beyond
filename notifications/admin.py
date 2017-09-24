from django.contrib import admin
from .models import Notifications


class NotificationsAdmin(admin.ModelAdmin):
    list_display = ('title', 'message', 'deadline', 'last_updated')

admin.site.register(Notifications, NotificationsAdmin)

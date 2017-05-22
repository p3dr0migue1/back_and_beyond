from django.views.generic import ListView

from .models import Notifications


class NotificationsView(ListView):
    template_name = 'notifications/aiva_countdown.html'
    model = Notifications

    def get_context_data(self, **kwargs):
        context = super(NotificationsView, self).get_context_data(**kwargs)
        return context

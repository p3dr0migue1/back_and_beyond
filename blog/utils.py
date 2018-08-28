from django.http import Http404


class StaffUserMixin:
    """
    Mixin which requires the user to be a staff user.
    """

    def dispatch(self, request, *args, **kwargs):
        if not request.user.is_staff:
            # raise 404
            raise Http404("View not found")
        return super().dispatch(request, *args, **kwargs)

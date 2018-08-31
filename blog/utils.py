from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from django.http import Http404


def pagination(queryset, paginate_by, page_number):
    # show 7 posts per page
    paginator = Paginator(queryset, paginate_by)
    # page = request.GET.get('page')

    try:
        page = paginator.page(page_number)
    except PageNotAnInteger:
        # if page is not an integer, deliver first page.
        page = paginator.page(1)
    except EmptyPage:
        # if page is out of range (e.g. 9999), deliver
        # last page of results.
        page = paginator.page(paginator.num_pages)
    return (paginator, page, page.object_list, page.has_other_pages())


class StaffUserMixin:
    """
    Mixin which requires the user to be a staff user.
    """

    def dispatch(self, request, *args, **kwargs):
        if not request.user.is_staff:
            # raise 404
            raise Http404("View not found")
        return super().dispatch(request, *args, **kwargs)

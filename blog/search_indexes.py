from haystack import indexes

from .services import PostService


class PostIndex(indexes.SearchIndex, indexes.Indexable):
    text = indexes.CharField(document=True, use_template=True)
    date_created = indexes.DateTimeField(model_attr='date_created')

    def index_queryset(self, using=None):
        return PostService().published()

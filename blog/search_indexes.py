from haystack import indexes

from .models import Posts


class PostIndex(indexes.SearchIndex, indexes.Indexable):
    text = indexes.CharField(document=True, use_template=True)
    date_created = indexes.DateTimeField(model_attr='date_created')

    def get_model(self):
        return Posts

    def index_queryset(self, using=None):
        return self.get_model().published.all()
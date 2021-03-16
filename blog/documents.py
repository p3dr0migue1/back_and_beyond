from django_elasticsearch_dsl import Document
from django_elasticsearch_dsl.registries import registry

# App imports
from .models import Posts


@registry.register_document
class PostDocument(Document):
    class Index:
        # name of elasticsearch index
        name = 'posts'
        settings = {
            'number_of_shards': 1,
            'number_of_replicas': 0
        }

    class Django:
        model = Posts
        fields = ['title', 'content']

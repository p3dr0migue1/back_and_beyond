from django.db.models import Count

from .models import Posts, PostTags


class PostService:

    @staticmethod
    def get_posts_in_tag(tag_slug):
        """
        Return all published posts associated with a tag.

        :param tag_slug: a String
        :return:         a Queryset
        """
        return Posts.objects.filter(tags__slug=tag_slug)\
                            .order_by('-date_created')\
                            .filter(status=2)

    @staticmethod
    def order_by(field, is_staff=False):
        """
        Return posts ordered by field.

        :param field:    a String
        :param is_staff: a Boolean value
        :return:         a Queryset
        """
        if is_staff:
            return Posts.objects.order_by(field)
        return Posts.objects.order_by(field).filter(status=2)

    @staticmethod
    def published():
        """
        Return all published posts.
        """
        return Posts.objects.filter(status=2)

    @staticmethod
    def similar_posts(tags_ids, post_id):
        """
        Return a queryset with latest 3 posts that
        contain 1 or more of the same tags.

        :param tags_ids: a List
        :param post_id:  an Integer
        :return:         a Queryset
        """
        posts = Posts.objects.filter(status=2)\
                             .filter(tags__in=tags_ids)\
                             .exclude(id=post_id)
        return posts.annotate(same_tags=Count('tags'))\
                    .order_by('-same_tags', '-date_created')[:3]


class PostTagsService:
    @staticmethod
    def create(post, tag):
        """
        Create a many to many relationship between Posts and Tags.

        :param post: a Post object
        :param tag:  a Tag object
        :return      a PostTags object
        """
        return PostTags.objects.create(post=post, tag=tag)

    @staticmethod
    def tags_in_published_posts():
        """
        Return all tags associated with published posts.

        Example:
        [
            {'tag__name': 'CSS', 'tag__slug': 'css', 'posts': 3},
            {'tag__name': 'Python', 'tag__slug': 'python', 'posts': 6},
            {'tag__name': 'Django', 'tag__slug': 'django', 'posts': 2},
        ]
        """
        return PostTags.objects.values('tag__name', 'tag__slug')\
                               .annotate(posts=Count('post'))\
                               .filter(post__status=2)\
                               .order_by('tag__name')

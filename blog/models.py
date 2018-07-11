import uuid

from django.db import models
from django.db.models import Count
from django.core.urlresolvers import reverse
from django.template.defaultfilters import slugify


class Tag(models.Model):
    name = models.CharField(max_length=100, unique=True)
    slug = models.SlugField(max_length=120, unique=True)
    # uuid = models.UUIDField(default=uuid.uuid4, editable=False)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Tag, self).save(*args, **kwargs)

    class Meta:
        verbose_name_plural = "Tags"

    def __str__(self):
        return self.name


class PostsManager(models.Manager):
    def get_posts_in_tag(self, tag):
        return self.filter(tags__slug=tag)


class PublishedManager(models.Manager):
    def get_queryset(self):
        return super(PublishedManager, self).get_queryset().filter(status=2)


class Posts(models.Model):
    POST_STATUS = (
        (1, 'Draft'),
        (2, 'Published'),
        (3, 'Private'),
        (4, 'Archived'),
    )
    title = models.CharField(max_length=200, unique=True)
    slug = models.SlugField(max_length=220, unique=True)
    content = models.TextField(blank=True, null=True)
    date_created = models.DateTimeField(auto_now=False, auto_now_add=True)
    last_updated = models.DateTimeField(auto_now=True, auto_now_add=False)
    views = models.IntegerField(default=0)
    likes = models.IntegerField(default=0)
    status = models.IntegerField(choices=POST_STATUS, default=1)
    tags = models.ManyToManyField(Tag, through='PostTags')
    # uuid = models.UUIDField(default=uuid.uuid4, editable=False)
    objects = PostsManager()
    published = PublishedManager()

    def get_tag_names(self):
        return ", ".join([cat.name for cat in self.tags.all()])
    get_tag_names.short_description = "Tags"

    def get_absolute_url(self):
        return reverse("blog:view-post", kwargs={"slug": self.slug})

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        super(Posts, self).save(*args, **kwargs)

    class Meta:
        verbose_name_plural = "Posts"
        # if two posts are created at the same time display
        # first the post that was updated first
        ordering = ["-date_created", "-last_updated"]

    def __str__(self):
        return self.title


class PostTags(models.Model):
    post = models.ForeignKey(Posts)
    tag = models.ForeignKey(Tag)
    # uuid = models.UUIDField(default=uuid.uuid4, editable=False)

    class Meta:
        verbose_name_plural = "post tags"

    @classmethod
    def posts_in_tags_queryset(cls):
        """
        Returns a queryset in the form of:
        [
            {'tag__name': 'CSS', 'tag__slug': 'css', 'posts': 3},
            {'tag__name': 'Python', 'tag__slug': 'python', 'posts': 6},
            {'tag__name': 'Django', 'tag__slug': 'django', 'posts': 2},
        ]
        """
        return cls.objects.values('tag__name', 'tag__slug')\
                          .annotate(posts=Count('post'))\
                          .filter(post__status=2)\
                          .order_by('tag__name')

    def __str__(self):
        return '{}'.format(self.tag.name)

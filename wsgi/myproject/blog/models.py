from django.db import models
from django.db.models import Count
from django.utils import timezone
from django.template.defaultfilters import slugify

import markdown


class Tag(models.Model):
    name = models.CharField(max_length=100, unique=True)
    slug = models.SlugField(max_length=120, unique=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Tag, self).save(*args, **kwargs)

    class Meta:
        verbose_name_plural = "Tags"

    def __str__(self):
        return self.name


class PostsManager(models.Manager):
    def by_slug(self, post_slug):
        return self.get(slug=post_slug)


class Posts(models.Model):
    POST_STATUS = (
        (1, 'Draft'),
        (2, 'Published'),
        (3, 'Private'),
        (4, 'Archived'),
    )
    title = models.CharField(max_length=200, unique=True)
    slug = models.SlugField(max_length=220, unique=True)
    markdown_text = models.TextField(blank=True, null=True)
    html_text = models.TextField(blank=True, null=True)
    date_created = models.DateTimeField(default=timezone.now, blank=True)
    last_updated = models.DateTimeField()
    views = models.IntegerField(default=0)
    likes = models.IntegerField(default=0)
    status = models.IntegerField(choices=POST_STATUS, default=1)
    tags = models.ManyToManyField(Tag, blank=True, through='PostTags')
    objects = PostsManager()

    def get_tag_names(self):
        return ", ".join([cat.name for cat in self.tags.all()])
    get_tag_names.short_description = "Tags"

    @classmethod
    def get_posts_in_tag(cls, tag):
        return cls.objects.filter(tags__slug=tag)

    def save(self, *args, **kwargs):
        self.html_text = markdown.markdown(
            self.markdown_text,
            ["markdown.extensions.extra", "codehilite"]
        )
        self.slug = slugify(self.title)
        self.last_updated = timezone.now()
        super(Posts, self).save(*args, **kwargs)

    class Meta:
        verbose_name_plural = "Posts"

    def __str__(self):
        return self.title


class PostTags(models.Model):
    post = models.ForeignKey(Posts)
    tag = models.ForeignKey(Tag)

    class Meta:
        verbose_name_plural = "post tags"

    @classmethod
    def get_tags_associated_with_posts(cls):
        return cls.objects.filter(post__status=2)\
                          .values('tag__name', 'tag__slug')\
                          .annotate(Count('tag'))

    def __str__(self):
        return '{}'.format(self.tag.name)

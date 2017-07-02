from django.db import models
from django.db.models import Count
from django.core.urlresolvers import reverse
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
    def get_posts_in_tag(self, tag):
        return self.filter(tags__slug=tag)


class Posts(models.Model):
    POST_STATUS = (
        (1, 'Draft'),
        (2, 'Published'),
        (3, 'Private'),
        (4, 'Archived'),
    )
    title = models.CharField(max_length=200, unique=True)
    slug = models.SlugField(max_length=220, unique=True)
    html_content = models.TextField(blank=True, null=True)
    markdown_content = models.TextField(blank=True, null=True)
    date_created = models.DateTimeField(auto_now=False, auto_now_add=True)
    last_updated = models.DateTimeField(auto_now=True, auto_now_add=False)
    views = models.IntegerField(default=0)
    likes = models.IntegerField(default=0)
    status = models.IntegerField(choices=POST_STATUS, default=1)
    tags = models.ManyToManyField(Tag, through='PostTags')
    objects = PostsManager()

    def get_tag_names(self):
        return ", ".join([cat.name for cat in self.tags.all()])
    get_tag_names.short_description = "Tags"

    def get_absolute_url(self):
        return reverse("blog:view-post", kwargs={"slug": self.slug})

    def save(self, *args, **kwargs):
        self.html_content = markdown.markdown(
            self.markdown_content,
            ["markdown.extensions.extra", "codehilite"]
        )
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

    class Meta:
        verbose_name_plural = "post tags"

    @classmethod
    def get_tags_associated_with_posts(cls):
        return cls.objects.filter(post__status=2)\
                          .values('tag__name', 'tag__slug')\
                          .annotate(Count('tag'))\
                          .order_by('tag__name')

    def __str__(self):
        return '{}'.format(self.tag.name)

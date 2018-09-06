from django.core.urlresolvers import reverse
from django.db import models

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

	def __str__(self):
		return '{}'.format(self.tag.name)

from __future__ import unicode_literals

from django.db import models


class Notifications(models.Model):
    title = models.CharField(max_length=255, unique=True)
    message = models.TextField(blank=True, null=True)

    class Meta:
        verbose_name_plural = "Notifications"

    def __unicode__(self):
        return self.title

    def __str__(self):
        return self.title

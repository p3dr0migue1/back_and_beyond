# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2017-07-02 20:38
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0005_auto_20170504_0638'),
    ]

    operations = [
        migrations.RenameField(
            model_name='posts',
            old_name='content',
            new_name='html_content',
        ),
        migrations.AddField(
            model_name='posts',
            name='markdown_content',
            field=models.TextField(blank=True, null=True),
        ),
    ]
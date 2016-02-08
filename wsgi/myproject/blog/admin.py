import models

from django.contrib import admin
from .models import Tag, Posts, PostTags


class TagsAdmin(admin.ModelAdmin):
    # Prepopulates the slug field automatically
    # from the title field
    prepopulated_fields = {'slug': ('name',)}
    list_display = ('name', 'slug')


class PostTagsInline(admin.TabularInline):
    model = models.PostTags
    extra = 1


class PostsAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('title',)}
    # readonly_fields = ('date_created', 'last_updated')
    inlines = [PostTagsInline]

    fieldsets = (
        (None, {
            'fields': ('title', 'slug', 'markdown_text', 'date_created',
                       'last_updated', 'status')
        }),
        ('HTML Content', {
            'classes': ('collapse',),
            'fields': ('html_text',),
        }),
    )


admin.site.register(Tag, TagsAdmin)
admin.site.register(Posts, PostsAdmin)

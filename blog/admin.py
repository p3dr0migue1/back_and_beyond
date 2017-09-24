from django.contrib import admin
from .models import Tag, Posts, PostTags


class TagsAdmin(admin.ModelAdmin):
    # Prepopulates the slug field automatically
    # from the title field
    prepopulated_fields = {'slug': ('name',)}
    list_display = ('name', 'slug')


class PostTagsInline(admin.TabularInline):
    model = PostTags
    extra = 1
    min_num = 1


class PostsAdmin(admin.ModelAdmin):
    list_display = ('title', 'status', 'date_created', 'last_updated')
    prepopulated_fields = {'slug': ('title',)}
    readonly_fields = ('date_created', 'last_updated')
    inlines = [PostTagsInline]

    fieldsets = (
        (None, {
            'fields': ('title', 'slug', 'content', 'date_created',
                       'last_updated', 'status')
        }),
    )


admin.site.register(Tag, TagsAdmin)
admin.site.register(Posts, PostsAdmin)

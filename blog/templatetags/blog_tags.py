import markdown

from django import template
from django.utils.safestring import mark_safe


register = template.Library()


@register.filter(name='markdown')
def markdown_format(text):
    return mark_safe(
        markdown.markdown(
            text,
            extensions=['extra', 'toc', 'admonition', 'codehilite'],
        )
    )


@register.filter
def highlight_search(text, search):
    highlighted = text.replace(search, '<span class="highlight">{}</span>'.format(search))
    return mark_safe(highlighted)

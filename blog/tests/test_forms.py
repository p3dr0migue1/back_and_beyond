from django.test import TestCase, RequestFactory
from django.contrib.auth.models import AnonymousUser, User
from django.contrib.sessions.middleware import SessionMiddleware
from django.core.urlresolvers import reverse
from django.test import Client

from ..forms import PostsForm, TagsForm
from ..models import Posts, Tag


class TestForms(TestCase):
    def setUp(self):
        self.tag = Tag.objects.create(name='Magazine')
        self.title = 'Timeout new magazine'
        self.content = 'This is a draft post!'

    def test_valid_post_form(self):
        data = {
            'title': self.title,
            'content': self.content,
            'tags': [self.tag.id,],
            'status': 1,
        }
        form = PostsForm(data=data)

        self.assertTrue(form.is_valid())

    def test_invalid_post_form(self):
        data = {
            'title': '',
            'content': self.content,
            'tags': [],
            'status': 1,
        }
        form = PostsForm(data=data)
        expected_errors = {
            'tags': [u'This field is required.'],
            'title': [u'This field is required.']
        }

        self.assertFalse(form.is_valid())
        self.assertDictEqual(form.errors, expected_errors)

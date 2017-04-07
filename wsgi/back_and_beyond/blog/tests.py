from django.test import TestCase, RequestFactory
from django.contrib.auth.models import AnonymousUser, User

from .views import index


class PostTestCase(TestCase):
    def setUp(self):
        self.factory = RequestFactory()
        self.user = User.objects.create_superuser(
            'pedro',
            'pedro@mail.co.uk',
            'admin'
        )

    def test_access_index_view_with_signout_user(self):
        request = self.factory.get('/')
        request.user = AnonymousUser()
        response = index(request)
        self.assertEqual(response.status_code, 302)
        self.assertEqual(response.url, '/login/?next=/')

    def test_index_view(self):
        request = self.factory.get('/')
        request.user = self.user
        response = index(request)
        self.assertEqual(response.status_code, 200)

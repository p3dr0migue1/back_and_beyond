from django.test import TestCase, RequestFactory
from django.contrib.auth.models import AnonymousUser, User
from django.contrib.sessions.middleware import SessionMiddleware
from django.core.urlresolvers import reverse
from django.test import Client

from ..models import Tag, Posts, PostTags
from ..views import index, NewPost, NewTag


class TestTags(TestCase):
    def setUp(self):
        self.factory = RequestFactory()
        self.user = User.objects.create_superuser(
            'pedro',
            'pedro@mail.co.uk',
            'admin'
        )

    def test_new_tag_page_rendering(self):
        request = self.factory.get('new-tag')
        request.user = self.user
        response = NewTag.as_view()(request)

        self.assertTrue(response.status_code, 200)

    def test_new_tag_created(self):
        form_addr = reverse('blog:new-tag')
        params = {'name': 'Europe Holidays'}

        self.client.login(username='pedro', password='admin')
        response = self.client.post(form_addr, params)

        self.assertTrue(Tag.objects.filter(name=params['name']).exists())
        self.assertTrue(response.status_code, 302)
        self.assertEqual(response.url, '/')

    def test_new_tag_name_required(self):
        form_addr = reverse('blog:new-tag')

        self.client.login(username='pedro', password='admin')
        response = self.client.post(form_addr, {})

        self.assertEqual(response.status_code, 200)
        self.assertFormError(response, 'form', 'name', 'This field is required.')

    def test_new_tag_popup_created(self):
        form_addr = reverse('blog:new-tag-popup')
        params = {'name': 'Weekend Escapades'}

        self.client.login(username='pedro', password='admin')
        response = self.client.post(form_addr, params)

        self.assertTrue(Tag.objects.filter(name=params['name']).exists())
        self.assertTrue(response.status_code, 200)
        # ToDo
        # mock assert handle_pop_add is called

    def test_new_tag_popup_name_required(self):
        form_addr = reverse('blog:new-tag-popup')

        self.client.login(username='pedro', password='admin')
        response = self.client.post(form_addr, {})

        self.assertEqual(response.status_code, 200)
        self.assertFormError(response, 'form', 'name', 'This field is required.')


class TestPosts(TestCase):
    def setUp(self):
        self.factory = RequestFactory()
        self.user = User.objects.create_superuser(
            'pedro',
            'pedro@mail.co.uk',
            'admin'
        )

    def test_access_index_view_with_logout_user(self):
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
        self.assertTrue('<h3>No posts to display yet..</h3>' in response.content)

    def test_index_view_displays_only_published_posts(self):
        Posts.objects.bulk_create(
            [
                Posts(
                    title='The first post',
                    slug='the-first-post',
                    content='This is the first post',
                    status=2
                ),
                Posts(
                    title='Think of a title',
                    slug='think-of-a-title',
                    content='This post is in development',
                    status=1
                ),
                Posts(
                    title='Dont tell anyone',
                    slug='dont-tell-anyone',
                    content='No one other than superusers should see this',
                    status=3
                ),
                Posts(
                    title='Show and tell',
                    slug='show-and-tell',
                    content='Another show and tell published',
                    status=2
                ),
            ]
        )

        request = self.factory.get('/')
        request.user = self.user
        response = index(request)

        self.assertEqual(response.status_code, 200)
        self.assertTrue('The first post' in response.content)
        self.assertTrue('Show and tell' in response.content)
        self.assertFalse('Dont tell anyone' in response.content)
        self.assertContains(response, '<article class="post">', count=2)

    def test_new_post_page(self):
        page_url = reverse('blog:new-post')

        self.client.login(username='pedro', password='admin')
        response = self.client.get(page_url)

        self.assertTrue(response.status_code, 200)

    def test_create_a_new_post(self):
        tag = Tag.objects.create(name='Magazine')
        page_url = reverse('blog:new-post')
        form_content = {
            'title': 'Time out!',
            'content': 'This is a draft post!',
            'tags': tag.id,
            'status': 1,
        }

        self.client.login(username='pedro', password='admin')

        response = self.client.post(page_url, form_content)

        self.assertEqual(response.status_code, 302)
        self.assertEqual(response.url, '/post/time-out/')
        self.assertTrue(Posts.objects.filter(title=form_content['title']).exists())

    def test_tags_is_required_in_creating_a_new_post(self):
        page_url = reverse('blog:new-post')
        form_content = {
            'title': 'Time out!',
            'content': 'This is a draft post!',
        }

        self.client.login(username='pedro', password='admin')

        response = self.client.post(page_url, form_content)

        self.assertEqual(response.status_code, 200)
        self.assertFormError(response, 'form', 'tags', 'This field is required.')
        self.assertFalse(Posts.objects.filter(title=form_content['title']).exists())

    def test_view_post(self):
        tag = Tag.objects.create(name='Cryptocurrency')
        post = Posts.objects.create(
            title='The Future of Cryptocurrency',
            content='Lorem ipsum content',
            status=2,)
        post_tags = PostTags.objects.create(post=post, tag=tag)
        page_url = reverse('blog:view-post', kwargs={'slug': post.slug})

        # login
        self.client.login(username='pedro', password='admin')
        response = self.client.get(page_url)

        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.request['PATH_INFO'], page_url)
        self.assertContains(response, 'The Future of Cryptocurrency')

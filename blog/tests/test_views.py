from django.test import TestCase, RequestFactory
from django.contrib.auth.models import AnonymousUser, User
from django.contrib.sessions.middleware import SessionMiddleware
from django.urls import reverse
from django.test import Client

from ..models import Posts, Tag
from ..services import PostTagsService
from ..views import PostCreate, PostList, TagCreate


class TestTags(TestCase):
    def setUp(self):
        self.factory = RequestFactory()

        # create non staff user
        self.non_staff_user = User.objects.create(
            username='larry',
            email='larry@mail.co.uk',
        )
        self.non_staff_user.set_password('larry86#')
        self.non_staff_user.save()

        # create staff user
        self.staff_user = User.objects.create_superuser(
            'pedro',
            'pedro@mail.co.uk',
            'pedro30#',
        )

    def test_rendering_new_tag_page_as_a_staff_user(self):
        request = self.factory.get('new-tag')
        request.user = self.staff_user
        response = TagCreate.as_view()(request)

        self.assertTrue(response.status_code, 200)

    def test_creating_a_new_tag_as_a_staff_user(self):
        form_addr = reverse('blog:new-tag')
        params = {'name': 'Europe Holidays'}

        self.client.login(username='pedro', password='pedro30#')
        response = self.client.post(form_addr, params)

        self.assertTrue(Tag.objects.filter(name=params['name']).exists())
        self.assertTrue(response.status_code, 302)
        self.assertEqual(response.url, '/')

    def test_creating_a_new_tag_requires_a_tag_name(self):
        form_addr = reverse('blog:new-tag')

        self.client.login(username='pedro', password='pedro30#')
        response = self.client.post(form_addr, {})

        self.assertEqual(response.status_code, 200)
        self.assertFormError(response, 'form', 'name', 'This field is required.')

    def test_creating_a_new_tag_in_popup_window_as_a_staff_user(self):
        form_addr = reverse('blog:new-tag-popup')
        params = {'name': 'Weekend Escapades'}

        self.client.login(username='pedro', password='pedro30#')
        response = self.client.post(form_addr, params)

        self.assertTrue(Tag.objects.filter(name=params['name']).exists())
        self.assertTrue(response.status_code, 200)
        # ToDo
        # mock assert handle_pop_add is called

    def test_creating_a_new_tag_in_popup_window_requires_a_tag_name(self):
        form_addr = reverse('blog:new-tag-popup')

        self.client.login(username='pedro', password='pedro30#')
        response = self.client.post(form_addr, {})

        self.assertEqual(response.status_code, 200)
        self.assertFormError(response, 'form', 'name', 'This field is required.')


class TestPosts(TestCase):
    def setUp(self):
        self.factory = RequestFactory()

        # create non staff user
        self.non_staff_user = User.objects.create(
            username='larry',
            email='larry@mail.co.uk',
        )
        self.non_staff_user.set_password('larry86#')
        self.non_staff_user.save()

        # create staff user
        self.staff_user = User.objects.create_superuser(
            'pedro',
            'pedro@mail.co.uk',
            'pedro30#'
        )

    def test_access_index_view_with_logout_user(self):
        request = self.factory.get('/')
        request.user = AnonymousUser()
        response = PostList.as_view()(request)
        self.assertEqual(response.status_code, 302)
        self.assertEqual(response.url, '/login/?next=/')

    def test_index_view_for_non_staff_users_displays_ok(self):
        request = self.factory.get('/')
        request.user = self.non_staff_user
        response = PostList.as_view()(request)
        self.assertEqual(response.status_code, 200)
        self.assertTrue('<h3>No posts to display yet..</h3>' in response.rendered_content)

    def test_index_view_for_non_staff_users_displays_only_published_posts(self):
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
        request.user = self.non_staff_user
        response = PostList.as_view()(request)

        self.assertEqual(response.status_code, 200)
        self.assertTrue('The first post' in response.rendered_content)
        self.assertTrue('Show and tell' in response.rendered_content)
        self.assertFalse('Dont tell anyone' in response.rendered_content)
        self.assertContains(response, '<article class="post">', count=2)

    def test_new_post_view_for_staff_users_displays_ok(self):
        page_url = reverse('blog:new-post')

        self.client.login(username='pedro', password='pedro30#')
        response = self.client.get(page_url)

        self.assertEqual(response.status_code, 200)

    def test_create_a_new_post_with_staff_user(self):
        tag = Tag.objects.create(name='Magazine')
        page_url = reverse('blog:new-post')
        form_content = {
            'title': 'Time out!',
            'content': 'This is a draft post!',
            'tags': tag.id,
            'status': 1,
        }

        self.client.login(username='pedro', password='pedro30#')

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

        self.client.login(username='pedro', password='pedro30#')

        response = self.client.post(page_url, form_content)

        self.assertEqual(response.status_code, 200)
        self.assertFormError(response, 'form', 'tags', 'This field is required.')
        self.assertFalse(Posts.objects.filter(title=form_content['title']).exists())

    def test_view_post_as_a_non_staff_user_displays_ok(self):
        tag = Tag.objects.create(name='Cryptocurrency')
        post = Posts.objects.create(
            title='The Future of Cryptocurrency',
            content='Lorem ipsum content',
            status=2,)
        post_tags = PostTagsService.create(post, tag)
        page_url = reverse('blog:view-post', kwargs={'slug': post.slug})

        # login
        self.client.login(username='larry', password='larry86#')
        response = self.client.get(page_url)

        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.request['PATH_INFO'], page_url)
        self.assertContains(response, 'The Future of Cryptocurrency')

    def test_post_update_view_displays_ok(self):
        tag = Tag.objects.create(name='Cryptocurrency')
        post = Posts.objects.create(
            title='The Future of Cryptocurrency',
            content='Lorem ipsum content',
            status=2,)
        post_tags = PostTagsService.create(post, tag)
        page_url = reverse('blog:edit-post', kwargs={'pk': post.pk})

        # login
        self.client.login(username='pedro', password='pedro30#')
        response = self.client.get(page_url)

        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.request['PATH_INFO'], page_url)

    def test_post_update_valid_form(self):
        tag = Tag.objects.create(name='Cryptocurrency')
        post = Posts.objects.create(
            title='The Future of Cryptocurrency',
            content='Lorem ipsum content',
            status=2,)
        post_tags = PostTagsService.create(post, tag)

        page_url = reverse('blog:edit-post', kwargs={'pk': post.pk})
        post_update = {
            'pk': post.pk,
            'title': 'Time out!',
            'content': 'This is a post update',
            'tags': tag.id,
            'status': 2,
        }

        self.client.login(username='pedro', password='pedro30#')
        response = self.client.post(page_url, post_update)
        post = Posts.objects.get(pk=post.pk)

        self.assertEqual(response.status_code, 302)
        self.assertEqual(post.title, post_update['title'])
        self.assertEqual(post.content, post_update['content'])

    def test_post_update_without_title_returns_invalid_form(self):
        tag = Tag.objects.create(name='Cryptocurrency')
        post = Posts.objects.create(
            title='The Future of Cryptocurrency',
            content='Lorem ipsum content',
            status=2,)
        post_tags = PostTagsService.create(post, tag)

        page_url = reverse('blog:edit-post', kwargs={'pk': post.pk})
        post_update = {
            'pk': post.pk,
            'title': '',
            'content': 'This is a post update',
            'tags': tag.id,
            'status': 2,
        }

        self.client.login(username='pedro', password='pedro30#')
        response = self.client.post(page_url, post_update)
        form = response.context_data['form']
        expected_form_error = {'title': ['This field is required.']}

        self.assertEqual(response.status_code, 200)
        self.assertFalse(form.is_valid())
        self.assertEqual(form.errors, expected_form_error)


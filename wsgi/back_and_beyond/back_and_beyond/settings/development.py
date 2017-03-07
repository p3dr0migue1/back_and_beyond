"""Development settings and globals"""
from __future__ import absolute_import

from .base import *


DEBUG = True

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': os.environ.get('BBDATABASE'),
        'USER': os.environ.get('BBUSER'),
        'PASSWORD': os.environ.get('BBPASSWORD'),
        'HOST': 'localhost',
        'PORT': '',
    }
}

# Application definition
INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
    'django_extensions'
)

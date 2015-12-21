"""Development settings and globals"""
from __future__ import absolute_import

from .base import *


DEBUG = True

# Database
# https://docs.djangoproject.com/en/1.8/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': os.environ.get('BBDATABASE'),
        'USER': os.environ.get('BBUSER'),
        'PASSWORD': os.environ.get('BBPASSWORD'),
        'HOST': '',
        'PORT': '',
    }
}

"""Development settings and globals"""
from __future__ import absolute_import

from .base import *


# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# Database
# https://docs.djangoproject.com/en/1.8/ref/settings/#databases
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'backandbeyond',
        'USER': 'pedro',
        'PASSWORD': 'admin',
        'HOST': '',
        'PORT': '',
    }
}

"""Development settings and globals"""
from __future__ import absolute_import

from .base import *


# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

from socket import gethostname
ALLOWED_HOSTS = [
    # For internal OpenShift load balancer security purposes.
    gethostname(),
    # Dynamically map to the OpenShift gear name.
    os.environ.get('OPENSHIFT_APP_DNS'),
    # 'example.com', # First DNS alias (set up in the app)
    # 'www.example.com', # Second DNS alias (set up in the app)
]

# Database
# https://docs.djangoproject.com/en/1.8/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': os.environ.get('PGDATABASE'),
        'USER': os.environ.get('PGUSER'),
        'PASSWORD': os.environ.get('OPENSHIFT_POSTGRESQL_DB_PASSWORD'),
        'HOST': '',
        'PORT': '',
    }
}

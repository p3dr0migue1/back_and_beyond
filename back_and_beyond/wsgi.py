"""
WSGI config for back_and_beyond project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

if 'DEVELOPMENT_SETTINGS' in os.environ.keys():
    settings_file = os.environ.get('DEVELOPMENT_SETTINGS')
else:
    settings_file = "back_and_beyond.settings.production"

# GETTING-STARTED: change 'back_and_beyond' to your project name:
os.environ.setdefault(
    "DJANGO_SETTINGS_MODULE", settings_file)

application = get_wsgi_application()

#!/usr/bin/env python
import os
import sys

if __name__ == "__main__":
    if 'DEVELOPMENT_SETTINGS' in os.environ.keys():
        settings_file = os.environ.get('DEVELOPMENT_SETTINGS')
    else:
        settings_file = "myproject.settings.production"

    os.environ.setdefault(
        "DJANGO_SETTINGS_MODULE", settings_file)
    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)

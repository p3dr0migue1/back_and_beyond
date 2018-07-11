#!/bin/bash

set -e
host="$1"      # db
user="$2"      # user
pass="$3"  # test
database="$4"  # backandbeyond
shift

until PGPASSWORD="$pass" psql -h "$host" -U "$user" "$database" -c '\q'; do
    >&2 echo "Postgres is unavailable - sleeping"
    sleep 1
done

# mysql is now accepting connections
>&2 echo "Postgres is up - executing command"

# start django
python manage.py runserver 0.0.0.0:8000

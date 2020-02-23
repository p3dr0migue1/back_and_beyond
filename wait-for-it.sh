#!/usr/bin/env sh

set -e
host="$1"      # db
user="$2"      # user
pass="$3"      # test
database="$4"  # backandbeyond
shift

until PGPASSWORD="$pass" psql -h "$host" -U "$user" "$database" -c '\q'; do
    >&2 echo "Postgres is unavailable - sleeping"
    sleep 1
done

# postgres is now accepting connections
>&2 echo "Postgres is up - executing command"

# * collect static files,
# * apply database migrations,
# * start django server
python manage.py collectstatic --noinput && \
python manage.py migrate && \
python manage.py runserver 0.0.0.0:8000

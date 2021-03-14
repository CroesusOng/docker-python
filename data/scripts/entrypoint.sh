#!/bin/sh

set -e

python manage.py collectstatic --noinput

uwsgi --socket :8000 --master --enable-threads --module app.wsgi

#python manage.py makemigrations
#python manage.py migrate 
#uvicorn example:app --reload --port 8000
#gunicorn app.asgi:application -k uvicorn.workers.UvicornWorker

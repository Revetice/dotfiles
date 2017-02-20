#!/bin/sh

virtualenv --no-site-packages venv
source venv/bin/activate

# django, psycopg2, gunicorn, dj-database-url, static3, dj-static, django-toolbelt
pip install django-toolbelt

django-admin startproject my_project .

# for heroku
# echo "web: gunicorn my_project.wsgi --log-file -"
# foreman start

pip freeze > requirements.txt

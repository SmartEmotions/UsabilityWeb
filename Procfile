web: gunicorn App.wsgi --log-file -
worker: celery worker -A App -E -l info

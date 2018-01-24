from .base import *

ENVIRONMENT = 'local'
DEBUG = True
DATABASES = {
    'default':
    {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'Thesis',
        'USER': 'postgres',
        'PASSWORD': 'postgres',
        'HOST': '127.0.0.1',
        'PORT': '5432',
    }
}

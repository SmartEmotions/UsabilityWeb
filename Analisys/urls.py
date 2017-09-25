from django.conf.urls import url, include
from Analisys.views import *

urlpatterns = [url(r'^inicio/', inicio, name='inicio'),
               url(r'^mdbootstrap/', mdbootstrap, name='mdbootstrap'),]

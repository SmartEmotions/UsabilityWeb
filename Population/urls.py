from django.conf.urls import url, include
from Population.views import *

urlpatterns = [url(r'^works/', getWorksTypes, name='grade-works'),]

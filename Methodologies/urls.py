from django.conf.urls import url
from rest_framework import routers
from Methodologies.views import *
router = routers.SimpleRouter()
router.register(r'methods', MethodologiesViewSet, base_name="methods")

urlpatterns = []
urlpatterns += router.urls

from django.conf.urls import url, include
from Population.views import *
from rest_framework import routers
router = routers.SimpleRouter()
router.register(r'webapps', WebaplicationsViewSet, base_name="web-apps")
router.register(r'gradeworks', GradeworksViewSet, base_name="works")

urlpatterns = [url(r'^works/', getWorksTypes, name='grade-works'),
               url(r'^searchWorks/', searchWorks, name='sea-wnames'),
               url(r'^searchWork/', searchWork, name='sea-work'),
               url(r'^addWork/', addWork, name='add-work'),
               url(r'^work/edit', editWork, name='work-edit'),
               url(r'^work/getcharac', getcharac, name='work-getcha'),
               url(r'^work/characterize', charWork, name='work-char'),]
urlpatterns += router.urls

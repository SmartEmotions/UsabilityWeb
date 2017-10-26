from django.conf.urls import url, include
from Main.views import initView, testHTML

urlpatterns = [ url(r'^$', initView, name='init-view'),
                url(r'^test/', testHTML, name='testView'),]

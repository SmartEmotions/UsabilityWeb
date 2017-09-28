from django.conf.urls import url, include
from Main.views import initView

urlpatterns = [url(r'^', initView, name='initView'),]

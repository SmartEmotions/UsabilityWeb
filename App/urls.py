from django.conf.urls import url, include
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^', include("Main.urls")),
    url(r'^', include("Analisys.urls")),
    url(r'^', include("Population.urls")),
]

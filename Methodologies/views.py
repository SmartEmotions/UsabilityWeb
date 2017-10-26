
from Methodologies.models import Methodologies
from Methodologies.serializer import *
from rest_framework import viewsets

class MethodologiesViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Methodologies.objects.all()
    serializer_class = MethodologiesSerializer

from rest_framework import serializers
from Methodologies.models import Methodologies

class MethodologiesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Methodologies
        fields = ("method_id","method_name")

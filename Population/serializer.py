from rest_framework import serializers
from Population.models import Webaplications, Gradeworks

class WebaplicationsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Webaplications
        fields = fields = '__all__'

class GradeworksSerializer(serializers.ModelSerializer):
    class Meta:
        model = Gradeworks
        fields = '__all__'

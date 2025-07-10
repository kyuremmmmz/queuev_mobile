from rest_framework import serializers
from QueingAppAPI.models import Users
from django.contrib.auth.hashers import *
class UserSerializers(serializers.ModelSerializer):
    class Meta:
        model = Users
        fields = ('id', 'name', 'username', 'password') 
        extra_kwargs = {
            'password':{'write_only':True}
        }
    def validate_password(self, value):
        if len(value) < 8:
            raise serializers.ValidationError("Password must be at least 8 characters long.")
        return make_password(value)

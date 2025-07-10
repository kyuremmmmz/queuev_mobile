from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from ...models.models import Users
from ..serializers.serializers import UserSerializers

@api_view(['POST'])
@csrf_exempt

def signup_view(request):
    serializer = UserSerializers(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(
            serializer.data, status=status.HTTP_201_CREATED
        )
    else:
        return Response(
            serializer.errors, status=status.HTTP_400_BAD_REQUEST
        )


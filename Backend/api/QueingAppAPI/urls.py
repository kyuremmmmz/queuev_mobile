from django.urls import path
from .api.views.views import signup_view

urlpatterns = [
    path('api/signup/POST', signup_view, name='QueingAppAPI'), 
]
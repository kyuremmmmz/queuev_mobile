from django.urls import path
from . import views


urlpatterns = [
    path("get", views.function, name="function")
]
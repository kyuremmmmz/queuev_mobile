from django.db import models
from django.contrib.auth.models import AbstractBaseUser, AbstractUser, BaseUserManager





class Users(AbstractBaseUser):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=200)
    username = models.CharField(max_length=30, unique=True)
    password = models.CharField(max_length=8 )



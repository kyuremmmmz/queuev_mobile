from django.db import models

class Users(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.TextField(max_length=200)
    age = models.CharField(max_length=200)
    



class Blog(models.Model):
    name = models.CharField(max_length=100)
    tagline = models.TextField()
    description = models.TextField()


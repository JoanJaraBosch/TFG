from django.db import models

# Create your models here.
class Student(models.Model):
    name = models.CharField(max_length=200)
    image = models.CharField(max_length=200)
    description = models.TextField(max_length=400)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['name']

    def __str__(self):
        return self.name


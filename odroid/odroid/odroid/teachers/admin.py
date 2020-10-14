from django.contrib import admin
from .models import Teacher
# Register your models here.

class TeacherAdmin(admin.ModelAdmin):
    readonly_fields = ('created', 'updated')

admin.site.register(Teacher, TeacherAdmin)


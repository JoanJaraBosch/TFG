from django.shortcuts import render, get_object_or_404
from .models import Teacher
# Create your views here.

def teacher(request, teacher_id):
    teacher = get_object_or_404(Teacher, id = teacher_id)
    return render(request, 'teachers/teacher.html',{'teacher':teacher})


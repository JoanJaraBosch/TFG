from django.shortcuts import render, get_object_or_404
from .models import Student
# Create your views here.

def teacher(request, student_id):
    teacher = get_object_or_404(Student, id = teacher_id)
    return render(request, 'students/student.html',{'student':student})

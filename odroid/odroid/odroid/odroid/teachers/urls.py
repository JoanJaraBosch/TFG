from django.urls import path
from . import views

urlpatterns = [
    path('<int:teacher_id>/', views.teacher, name="teacher")
]

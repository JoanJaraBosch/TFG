from django.urls import path
from . import views

urlpatterns = [
    path('<int:student_id>/', views.student, name="student")
]

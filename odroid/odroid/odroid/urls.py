"""odroid URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path
from django.conf.urls import include
from core import views
from django.views.static import serve
from django.conf import settings

app_name='odroid'

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home, name='home'),
    path('descarrega/', views.descarrega, name='descarrega'),
    path('manual/', views.manual, name='manual'),
    path('nosaltres/', views.about, name='nosaltres'),
    path('monitoritzacio/', views.monitoring, name='monitoritzacio'),
    path('page', include('pages.urls')),
    path('login/',views.user_login,name='login'),
    path('logout/',views.user_logout,name='logout'),
    path('i18n/', include('django.conf.urls.i18n')),
    path('manteniment', views.manteniment ,name='manteniment'),
]

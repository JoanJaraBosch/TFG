from django.shortcuts import render, HttpResponse
from django.contrib import messages
from core.forms import UserForm,UserProfileInfoForm
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.conf import settings
from django.contrib.auth.decorators import login_required
import json, os, requests

#Views part of the core App. We can see all the functions to redirect to our pages.
# Create your views here. Where all the views render correctly.
def home(request):
	return render(request, "core/home.html")

def about(request):
    return render(request, "core/about.html")

def manual(request):
    return render(request, "core/manual.html")

def descarrega(request):
    return render(request, "core/descarrega.html")

#This view is the "special view", because we want the user log in to see this view.
@login_required
def monitoring(request):
    #pout,perr = subprocess.Popen(['nmap', '192.168.43.63', '-oX', '-'], shell=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    file = open(os.path.join(settings.BASE_DIR, filename))
    return render(request, "core/monitoring.html")


@login_required
def special(request):
    return HttpResponse("Has iniciat sessió correctament !")

@login_required
def user_logout(request):
    logout(request)
    return render(request, "core/home.html")

def user_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user:
            if user.is_active:
                login(request,user)
                return HttpResponseRedirect(reverse('home'))
            else:
                login(request, user)
                return HttpResponse("Your account was inactive.")
        else:
            print("Someone tried to login and failed.")
            print("They used username: {} and password: {}".format(username,password))
            return HttpResponse("Invalid login details given")
    else:
        return render(request, 'core/login.html', {})

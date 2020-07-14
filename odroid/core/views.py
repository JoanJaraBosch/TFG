from django.shortcuts import render, HttpResponse
from django.contrib.auth import authenticate, login
from django.contrib import messages
from core.forms import UserForm,UserProfileInfoForm
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.contrib.auth.decorators import login_required
import json
import requests

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
    return render(request, "core/monitoring.html")


@login_required
def special(request):
    return HttpResponse("Has iniciat sessió correctament !")

@login_required
def user_logout(request):
    logout(request)
    return render(request, "core/home.html")

def register(request):
    registered = False
    if request.method == 'POST':
        user_form = UserForm(data=request.POST)
        profile_form = UserProfileInfoForm(data=request.POST)
        if user_form.is_valid() and profile_form.is_valid():
            user = user_form.save()
            user.set_password(user.password)
            user.save()
            profile = profile_form.save(commit=False)
            profile.user = user
            if 'profile_pic' in request.FILES:
                print('found it')
                profile.profile_pic = request.FILES['profile_pic']
            profile.save()
            registered = True
            login(request, user)
        else:
            print(user_form.errors,profile_form.errors)
    else:
        user_form = UserForm()
        profile_form = UserProfileInfoForm()
    return render(request,'core/registration.html',
                          {'user_form':user_form,
                           'profile_form':profile_form,
                           'registered':registered})

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
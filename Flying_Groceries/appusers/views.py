from django.shortcuts import render,redirect
from django.http import HttpResponse
from appusers.models import Customer
from django.contrib.auth import authenticate, login as dj_login, logout as dj_logout 
from . import db_connection
from django.contrib.auth.decorators import login_required


# Create your views here.
def loginCustomer(request):
    message = ""
    if request.method=="POST":
        userName = request.POST.get("userName")
        Password = request.POST.get("password")
        print(Customer.objects.all())
        user = authenticate(request,username=userName,password = Password)
        if user is not None and user.role=="CUSTOMER":
            dj_login(request,user)
            print("Customer is valid")
            return redirect("/shop/home")
        else:
            message = "Invalid username or password please try again!!"
            if user is not None:
                print(user.role)
            request.session['invalid_user'] = 1

    params = {"message":message}
    return render(request,"appusers/login.html",params)


def signupCustomer(request):
    message =""
    if request.method == "POST":
        firstName = request.POST.get("firstName")
        lastName = request.POST.get("lastName")
        uName = request.POST.get("userName")
        pwd = request.POST.get("password")
        confirmedPassword = request.POST.get("confirmPassword")
        phoneNumber = request.POST.get("phoneNumber")
        houseNumber = request.POST.get("houseNumber")
        pincode = request.POST.get("pincode")
        city = request.POST.get("city")
        locality = request.POST.get("locality")
        print("First Name = ",firstName)
        print("Last Name = ",lastName)        
        print("User Name = ",uName)
        print("Password = ",pwd)
        print("Confirmed Password = ",confirmedPassword)
        print("Phone Number = ",phoneNumber)
        print("House Number = ",houseNumber)
        print("Pincode = ",pincode)
        print("City = ",city)
        print("Locality = ",locality)
        print("Username = ",type(uName))
        print("Password = ",type(pwd))
        if(len(phoneNumber)!=10):
            message = "Please enter a valid 10 digit mobile number and try again"
            params = {"message":message}
            return render(request,"appusers/signup.html",params)
        
        if pwd== confirmedPassword:
            try:
                user = Customer.objects.create_user(username= uName,password = pwd)
                user.save()
                db_connection.addCustomer(firstName,lastName,uName,pwd,phoneNumber,houseNumber,pincode,city,locality)
            except:
                print("Here")
                print(Customer.objects.all())
                user = None
        else:
            message = "The confirmed password and actual password do not match"
        if user!=None:
            dj_login(request,user)
            return redirect("/shop/home")
        else:
            message="Username or phone number already registered"
            request.session['register_error']=1
    params = {'message':message}
    return render(request,"appusers/signup.html",params)

@login_required(login_url='/appusers/customer/login')
def logoutCustomer(request):
    current_user = request.user
    if current_user.role=='CUSTOMER':
        dj_logout(request)
    return redirect("/shop/home")



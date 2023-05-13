from django.shortcuts import render,redirect
from django.http import HttpResponse,JsonResponse
from appusers.models import Customer
from django.contrib.auth import authenticate, login as dj_login, logout as dj_logout,get_user_model
from . import db_connection
from django.contrib.auth.decorators import login_required
from appusers.models import Transporter
from pandas import to_datetime
from datetime import datetime
import json
User = get_user_model()

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



def loginTransporter(request):
    message=""
    if request.method=="POST":
        userName = request.POST.get("userName")
        Password = request.POST.get("password")
        user = authenticate(request,username=userName,password = Password)
        if user is not None and user.role =="TRANSPORTER":
            dj_login(request,user)
            return redirect("/appusers/transporter/profile")
        else:
            message = "Invalid username or password please try again!!"
            request.session['invalid_user']=1
    params = {"message":message}
    return render(request,"appusers/login_transporter.html",params)

@login_required(login_url="/appusers/transporter/login")
def logoutTransporter(request):
    current_user = request.user
    if current_user.role=='TRANSPORTER':
        dj_logout(request)
    return redirect("/shop/home")

@login_required(login_url = "/appusers/transporter/login")
def transporterProfile(request):
    if request.user.role==' TRANSPORTER':
        return HttpResponse("You are not permitted to view this page")
    if request.method=="POST":
        firstName = request.POST.get("firstName")
        middleName = request.POST.get("middleName")
        lastName = request.POST.get("lastName")
        currentActiveOrders = request.POST.get("activeOrders")
        Myusername = request.POST.get("username")
        Mypassword = request.POST.get("password")
        phoneNumber = request.POST.get("phoneNumber")
        salary = request.POST.get("salary")
        transporterId = request.POST.get("id")
        print("First name = ",firstName)
        print("Middle name = ",middleName)
        print("Last Name = ",lastName)
        print("currentActiveOrders = ",currentActiveOrders)
        print("Username = ",Myusername)
        print("Password = ",Mypassword)
        print("Phone Number = ",phoneNumber)
        print("Salary = ",salary)
        print("Transporter Id = ",transporterId)
        transporter = Transporter.objects.get(username = request.user.username)
        transporter.delete()
        newTransporter = Transporter.objects.create_user(username = Myusername,password = Mypassword)
        newTransporter.save()
        print(newTransporter)
        db_connection.updateTransporterInfo(firstName,middleName,lastName,Myusername,Mypassword,phoneNumber,transporterId)
        return redirect("/appusers/transporter/login/")
    current_user = request.user
    if current_user.role!='TRANSPORTER':
        return HttpResponse("You are not permitted to views this page")
    username = current_user.username
    userDetails = db_connection.getTransporterDetails(username)
    id = userDetails[0][0]
    username = userDetails[0][1]
    password = userDetails[0][2]
    firstName = userDetails[0][3]
    middleName = userDetails[0][4]
    lastName = userDetails[0][5]
    phoneNumber = userDetails[0][6]
    currentActiveOrders = userDetails[0][10]
    salary = userDetails[0][11]
    params = {"id":id,"username":username,"password":password,"firstName":firstName,"middleName":middleName,"lastName":lastName,"phoneNumber":phoneNumber,"currentActiveOrders":currentActiveOrders,"salary":salary}
    return render(request,"appusers/profile_Transporter.html",params)

@login_required(login_url = "/appusers/transporter/login")
def getOrders(request):
    if(request.user.role!='TRANSPORTER'):
        return HttpResponse("You are not permitted to view this page")
    print(request.user.username)
    transporterId = db_connection.getTransporterId(request.user.username)
    print("Transporter Id = ",transporterId)
    print(transporterId)
    orders = db_connection.getOrders(transporterId)
    print(orders)
    finalOrders=[]
    for i in orders:
        finalOrder=[]
        dates = to_datetime(i[0]).date()
        dates1 = dates.strftime("%d-%m-%Y")
        finalOrder.append(dates1)
        for j in i[1:]:
            finalOrder.append(j)
        finalOrders.append(finalOrder)

    print(finalOrders)
    currDate = datetime.now()
    print(currDate)
    currDate = currDate.strftime("%d/%m/%Y")
    params = {"orders":finalOrders,"currDate":currDate}
    return render(request,"appusers/active_orders.html",params)

@login_required(login_url  = "/appusers/customer/login")
def customerProfile(request):
    if request.user.role!='CUSTOMER':
        return HttpResponse("You are not permitted to view this page")
    if request.method=="POST":
        firstName = request.POST.get("firstName")
        middleName = request.POST.get("middleName")
        lastName = request.POST.get("lastName")
        Myusername = request.POST.get("username")
        Mypassword = request.POST.get("password")
        phoneNumber = request.POST.get("phoneNumber")
        customerId = request.POST.get("customerId")
        houseNumber = request.POST.get("houseNumber")
        pincode = request.POST.get("pincode")
        city = request.POST.get("city")
        locality = request.POST.get("locality")
        print("First Name = ",firstName)
        print("Middle Name = ",middleName)
        print("Last Name = ",lastName)
        print("Username = ",Myusername)
        print("Password = ",Mypassword)
        print("Phone Number = ",phoneNumber)
        print("Customer Id =",customerId)
        print("House Number = ",houseNumber)
        print("Pincode = ",pincode)
        print("City = ",city)
        print("Locality = ",locality)
        customer = Customer.objects.get(username = request.user.username)
        customer.delete()
        newCustomer = Customer.objects.create_user(username = Myusername,password = Mypassword)
        newCustomer.save()
        print(newCustomer)
        db_connection.updateCustomerInfo(firstName,middleName,lastName,Myusername,Mypassword,phoneNumber,customerId,houseNumber,pincode,city,locality)
        return redirect("/appusers/customer/login/")
    current_user = request.user
    if current_user.role!='CUSTOMER':
        return HttpResponse("You are not permitted to views this page")
    username = current_user.username
    userDetails = db_connection.getCustomerDetails(username)
    id = userDetails[0][0]
    username = userDetails[0][1]
    password = userDetails[0][2]
    firstName = userDetails[0][3]
    middleName = userDetails[0][4]
    lastName = userDetails[0][5]
    phoneNumber = userDetails[0][6]
    houseNumber = userDetails[0][7]
    pincode = userDetails[0][8]
    city = userDetails[0][9]
    locality=userDetails[0][10]
    params = {"id":id,"username":username,"password":password,"firstName":firstName,"middleName":middleName,"lastName":lastName,"phoneNumber":phoneNumber,"houseNumber":houseNumber,"pincode":pincode,"city":city,"locality":locality}
    return render(request,"appusers/profile_customer.html",params)


@login_required(login_url='/appusers/customer/login')
def getActiveOrders(request):
    if request.user.role!='CUSTOMER':
        return HttpResponse("You are not permitted to view this page")
    
    is_ajax = request.headers.get('X-Requested-With') == 'XMLHttpRequest'
    if is_ajax:
        if request.method=="POST":
            data = json.load(request)
            purpose = data.get('myStr')
            checkoutDate = data.get('checkoutDate')
            print("checkoutDate = ",checkoutDate)
            print(purpose)
            print(checkoutDate)
            customerId = db_connection.getCustomerId(request.user.username)
            db_connection.cancelOrders(purpose,checkoutDate,customerId)
            return JsonResponse({'status':'Done'})
        
        return JsonResponse({'status': 'Invalid request'}, status=400)

    customers = db_connection.getCustomerDetails(request.user.username)
    customerId = customers[0][0]
    print("Customer Id = ",customerId)
    orders = db_connection.getActiveOrders(customerId)
    print(orders)
    return render(request,'appusers/current_orders.html',context={"order":orders.values(),"date":orders.keys()})

@login_required(login_url='/appusers/customer/login')
def orderHistory(request):
    if request.user.role!='CUSTOMER':
        return HttpResponse("You are not permitted to view this page")
    customers = db_connection.getCustomerDetails(request.user.username)
    customerId = customers[0][0]
    orders=db_connection.getPastOrders(customerId)
    return render(request,'appusers/order_history.html',context={"order":orders.values(),"date":orders.keys()})
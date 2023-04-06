from django.shortcuts import redirect, render
from django.http import HttpResponse,JsonResponse
from . import db_connection
from django.contrib.auth import authenticate, login as dj_login, logout as dj_logout,get_user_model
from .utils import get_plot
from django.contrib.auth.decorators import login_required


User = get_user_model()

# Create your views here.
@login_required(login_url = '/caretaker/login')
def transporterRequests(request):
    current_user = request.user
    if(current_user.role!='ADMIN'):
        return HttpResponse("You are not permitted to view this page")
    lst = db_connection.getRequests()
    if request.method == "POST":
        requestId = request.POST.get("requestId")
        decision = request.POST.get("decision")
        requestId = int(requestId)
        decision = int(decision)
        print("Request Id = ",requestId)
        print("Decision = ",decision)
        db_connection.setStatus(requestId,decision)
    params = {'Requests':lst}
    return render(request,'caretaker/requests3.html',params)

@login_required(login_url = '/caretaker/login')
def approved(request):
    lst = db_connection.getTransporters()
    params={'Transporters':lst}
    return render(request,'caretaker/Approved_Transporters.html',params)

@login_required(login_url = '/caretaker/login')
def analytics(request):
    current_user = request.user
    if(current_user.role!='ADMIN'):
        return HttpResponse("You are not permitted to view this page")
    lst = db_connection.getAnalysis()
    lst1 = db_connection.getOrderAnalysis()
    lst2= db_connection.getTransporterAnalysis()
    x1=lst1[0]
    y1=lst1[1]
    x=lst[0]
    x=[str(i) for i in x]
    y=lst[1]
    rows=lst[2]
    total =rows.pop()
    chart = get_plot(x,y,0)
    chart1 = get_plot(x1,y1,1)
    params = {'chart':chart,'rows':rows,'total':total[1],'chart1':chart1,'transporter':lst2}
    return render(request,'caretaker/Analytics2.html',params)

@login_required(login_url = '/caretaker/login')
def signup(request):
    current_user = request.user
    if current_user.role!='ADMIN':
        return HttpResponse("You are not permitted to view this page")
    message = ""
    if request.method == "POST":
        uname = request.POST.get("username")
        Password = request.POST.get("password")
        confirmedPassword = request.POST.get("confirmedPass")
        FirstName = request.POST.get("FirstName")
        print(uname,Password,confirmedPassword)
        # user = None
        if Password==confirmedPassword:
            try:
                user = User.objects.create_user(uname,'',Password)
                user.save()
                db_connection.addAdmin(uname,Password,FirstName)
            except:
                user = None
        else:
            message+= "Password not same as confirmed Passoword. Please try again"
        if user!=None:
            dj_login(request,user)
            return redirect("/caretaker/analytics")
        else:
            request.session['register_error']=1
    params = {'message':message}
    return render(request,'caretaker/signup.html',params)


def login(request):
    if request.method =="POST":
        username = request.POST.get("username")
        Password = request.POST.get("password")
        user = authenticate(request,username=username,password = Password)
        if user is not None and user.role=='ADMIN':
            dj_login(request,user)
            print("User is valid")
            return redirect("/caretaker/analytics")
        else:
            if(user is not None):
                print(user.role)
            print("User is not valid")
            request.session['invalid_user'] = 1
    return render(request,'caretaker/login.html')


@login_required(login_url = '/caretaker/login')
def logout(request):
    current_user = request.user
    if current_user.role=='ADMIN':
        print(current_user.role)
        dj_logout(request)
    # Anonymus User
    return redirect("/caretaker/login")


# https://www.youtube.com/watch?v=x8yxM7rCvEc
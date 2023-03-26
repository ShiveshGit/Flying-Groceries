from django.shortcuts import render
from django.http import HttpResponse,JsonResponse
from . import db_connection
from .utils import get_plot

# Create your views here.
def transporterRequests(request):
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
def analytics(request):
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

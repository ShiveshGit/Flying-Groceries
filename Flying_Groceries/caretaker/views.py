from django.shortcuts import render
from django.http import HttpResponse,JsonResponse
from . import db_connection

# Create your views here.
def transporterRequests(request):
    lst = db_connection.getRequests()
    if request.method == "POST":
        requestId = request.POST.get("requestId")
        decision = request.POST.get("decision")
        requestId = int(requestId)
        decision = int(decision)
        # print(type(requestId))
        # print(type(decision))
        # print(requestId,decision)
        print("Request Id = ",requestId)
        print("Decision = ",decision)
        # db_connection.setStatus(requestId,decision)
    params = {'Requests':lst}
    return render(request,'caretaker/requests3.html',params)
def analytics(request):
    lst = db_connection.getAnalysis()
    ls1 = []
    for i in lst:
        if None in i:
            ls1.append(i)
    print(ls1)
    ls2 = []
    for i in ls1:
        val1=i[0]
        val2=i[2]
        print(type(val1),type(val2))
        if val1 != None:
            ls2.append((val1,val2))
    print(ls2)
    xaxis =[]
    yaxis =[]
    for i in ls2:
        xaxis.append(i[0])
        yaxis.append(i[1])
    print(xaxis)
    print(yaxis)
    params = {'xaxis':xaxis,'yaxis':yaxis}
    return render(request,'caretaker/Analytics2.html',params)

# def getOption(request):
#     ourTransporter = 
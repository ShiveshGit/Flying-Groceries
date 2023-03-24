from django.shortcuts import render
from django.http import HttpResponse
from . import db_connection
# Create your views here.
def transporterRequests(request):
    return render(request,'caretaker/requests.html')
def analytics(request):
    lst = db_connection.getAnalysis()
    ls1 = []
    for i in lst:
        if None in i:
            ls1.append(i)
    print(ls1)
    ls2 = []
    for i in ls1:
        # print(i)
        val1=i[0]
        val2=i[2]
        # print(val1,val2)
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
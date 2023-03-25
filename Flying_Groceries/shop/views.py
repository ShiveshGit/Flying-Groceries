from django.shortcuts import render
from django.http import HttpResponse
from . import db_connection
# Create your views here.
def index(request,*args,**kwargs):
    print("Post = ",request.POST)
    catId=1
    subCatId=1
    if(kwargs=={}):
        catId=1
        subCatId=1
    else:
        catId=kwargs['catid']
        subCatId=kwargs['subcatid']

    categories = db_connection.getCategories()
    subCategories = db_connection.getSubCategories(catId)
    products = db_connection.getProducts(catId,subCatId)
    categories1=categories[0:5]
    categories2=categories[5:]
    print(subCategories)
    params = {'categories1' : categories1,'categories2':categories2,'subCategories':subCategories,'products':products,'ActiveSubCategory':subCategories[subCatId-1][2],'Products' : products,'ActiveCategoryId':catId}
    return render(request,'shop/index_final3.html',params)
def test(request):
    return render(request,'shop/base.html')
def apis(request):
    print(request.POST)
    # print(request.POST.get())
    return HttpResponse(request.POST)
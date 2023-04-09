from django.shortcuts import render,redirect
from django.http import HttpResponse, JsonResponse
from . import db_connection
import random
import json



# Create your views here.
def landing(request):
    return render(request,"shop/landing.html")



def index(request, *args, **kwargs):
    print("Post = ", request.POST)
    catId = 1
    subCatId = 1
    if kwargs == {}:
        catId = 1
        subCatId = 1
    else:
        catId = kwargs["catid"]
        subCatId = kwargs["subcatid"]

    categories = db_connection.getCategories()
    subCategories = db_connection.getSubCategories(catId)
    products = db_connection.getProducts(catId, subCatId)
    categories1 = categories[0:5]
    categories2 = categories[5:]
    params = {
        "categories1": categories1,
        "categories2": categories2,
        "subCategories": subCategories,
        "products": products,
        "ActiveSubCategory": subCategories[subCatId - 1][2],
        "Products": products,
        "ActiveCategoryId": catId,
    }
    return render(request, "shop/index_final3.html", params)



def add(request):
    return redirect("/shop/home")


def cart(request):
    print("Here")
    prodId = -1
    is_ajax = request.headers.get('X-Requested-With') == 'XMLHttpRequest'
    if is_ajax:
        if request.method == 'POST':
            data = json.load(request)
            purpose = data.get('purpose')
            userId =-1
            if request.user.is_anonymous==False:
                    current_user = request.user
                    username = current_user.username
                    userId = db_connection.getUserId(username)
                    userId = userId[0]
            if purpose==1:
                prodId = data.get('productId')
                catId = data.get('categoryId')
                subCatId = data.get('subCategoryId')
                print("Product Id = ",prodId)
                print("Category Id = ",catId)
                print("SubCategory Id = ",subCatId)
                if userId!=-1:
                    print(userId)
                    db_connection.addToCart(userId,catId,subCatId,prodId)
                    print("Entry made")
                # db_connection.addToCart(username,prodId)
            else:
                quantity = data.get('quantity')
                catId = data.get('category')
                subCatId = data.get('subCategory')
                productId = data.get('product')
                print("Product Id = ",productId)
                print("Category Id = ",catId)
                print("SubCategory Id = ",subCatId)
                print("Quantity = ",quantity)
                print("Here")
                if userId!=-1:
                    print(userId)
                    db_connection.updateCart(userId,productId,catId,subCatId,quantity)
                    print("Entry made")
            return JsonResponse({'status':'Done'})
        return JsonResponse({'status': 'Invalid request'}, status=400)
    else:
        if request.method=="POST":
            print("2oihoi32hf2hfo")
            return redirect("/shop/checkout")
        else:
            if request.user.is_anonymous==True:
                return render(request,"shop/cart.html")
            current_user = request.user
            username = current_user.username
            prods = db_connection.getProducts1(username)
            if(len(prods)==0):
                prods = [(100,100,1000,"Product-1",0,3),(100,100,2000,"Product-2",0,4),(100,100,3000,"Product-3",0,0),(100,100,4000,"Product-4",0,0)]
            finalSubtotal=0
            for i in prods:
                finalSubtotal+=i[4]*i[5]
            print(finalSubtotal)
            taxes = random.random()*100
            taxes=int(taxes)
            print(taxes)
            if finalSubtotal == 0:
                taxes=0
            finalTotal=finalSubtotal+taxes
            params = {"products":prods,"total":len(prods),"finalSubtotal":finalSubtotal,"taxes":taxes,"finalTotal":finalTotal}
            print(prods)
        return render(request,"shop/cart.html",params)
    
def removeFromCart(request,*args,**kwargs):
    if request.user.is_anonymous==False:
        currUser = request.user
        username = currUser.username
        userId = db_connection.getUserId(username)
        userId = userId[0]
        catId = kwargs["catid"]
        subCatId = kwargs["subcatid"]
        prodId = kwargs["prodid"]
        db_connection.removeProductFromCart(catId,subCatId,prodId,userId)
    return redirect("/shop/cart")


def checkoutCart(request):
    print("Here in checkout")
    if request.user.is_anonymous==True:
        message = "You must login before placing an order."
        params = {"message":message}
        redirect("shop/cart",params)
    else:
        currUser = request.user
        username = currUser.username
        userId = db_connection.getUserId(username)
        userId = userId[0]
        print(userId)
        db_connection.checkOutCart(userId)
        return HttpResponse("Order Place Successfully")

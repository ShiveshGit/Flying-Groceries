from django.contrib import admin
from django.urls import path, include, re_path
from . import views

urlpatterns = [
    path("home/", views.index, name="ShopHome"),
    path("home/<int:catid>/<int:subcatid>", views.index, name="Shops"),
    path("add/",views.add,name="add"),
    path("cart",views.cart,name="cart"),
    path("remove/<int:catid>/<int:subcatid>/<int:prodid>",views.removeFromCart,name="removeFromCart"),
    path("checkout/",views.checkoutCart,name="checkout"),
    path("",views.landing,name="")
]

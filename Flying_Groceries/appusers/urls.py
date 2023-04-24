from django.contrib import admin
from django.urls import path,include,re_path
from . import views
urlpatterns=[
    path('customer/signup/',views.signupCustomer,name="signup"),
    path('customer/login/',views.loginCustomer,name="login"),
    path('customer/logout/',views.logoutCustomer,name="logout"),
    path('customer/profile/',views.customerProfile,name="profile"),
    path('activeorders',views.getActiveOrders,name="activeOrders"),
    path('customer/orderhistory/',views.orderHistory,name="orderHistory"),
    path('transporter/login/',views.loginTransporter,name="loginTransporter"),
    path('transporter/logout/',views.logoutTransporter,name="logoutTransporter"),
    path('transporter/profile/',views.transporterProfile,name="profileTransporter"),
    path('transporter/orders/',views.getOrders,name="getOrders")
]

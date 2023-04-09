from django.contrib import admin
from django.urls import path,include,re_path
from . import views
urlpatterns=[
    path('customer/signup/',views.signupCustomer,name="signup"),
    path('customer/login/',views.loginCustomer,name="login"),
    path('customer/logout/',views.logoutCustomer,name="logout")
]

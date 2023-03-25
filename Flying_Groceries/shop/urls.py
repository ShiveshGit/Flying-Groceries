from django.contrib import admin
from django.urls import path,include,re_path
from . import views
urlpatterns=[
    path('home/',views.index,name="ShopHome"),
    path('home/<int:catid>/<int:subcatid>',views.index,name="Shops"),
    path('test/',views.test,name="test"),
    path('api',views.apis,name="apis")
]
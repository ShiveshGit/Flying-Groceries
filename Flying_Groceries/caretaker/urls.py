from django.contrib import admin
from django.urls import path,include,re_path
from . import views
urlpatterns=[
    path('requests/',views.transporterRequests,name="ShopHome"),
    path('analytics/',views.analytics,name="Analytics"),
    # path('getoption',views.getOption,name = "getOption")
]

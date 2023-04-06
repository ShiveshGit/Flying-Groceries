from django.contrib import admin
from django.urls import path,include,re_path
from . import views
urlpatterns=[
    path('requests/',views.transporterRequests,name="ShopHome"),
    path('analytics/',views.analytics,name="Analytics"),
    path('approved/',views.approved,name="Approved"),
    path('signup/',views.signup,name="signup"),
    path('login/',views.login,name="login"),
    path('logout/',views.logout,name="logout")
    # path('getoption',views.getOption,name = "getOption")
]

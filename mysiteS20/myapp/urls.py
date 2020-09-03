from django.contrib import admin
from django.urls import path,include
from myapp import views


app_name = 'myapp'

urlpatterns = [
    path(r'', views.index, name='index'),
    path(r'about', views.about,name='about'),
    path(r'<int:top_no>/', views.detail,name='detail'),
    path(r'courses',views.courses, name='courses'),
    path(r'courses/<int:cour_id>/',views.coursedetail, name='coursedetail'),
    path(r'place_order',views.place_order, name='placeorder'),
    path(r'login', views.user_login, name='login'),
    path(r'logout', views.user_logout, name='logout'),
    path(r'myaccount', views.myaccount, name='myaccount'),
    path(r'register', views.register, name='register'),
    path(r'password_reset', views.password_reset_request, name='password_reset'),


]
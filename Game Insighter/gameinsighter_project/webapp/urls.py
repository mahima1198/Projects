from django.contrib import admin
from django.urls import path
from . import views

app_name = 'webapp'

urlpatterns = [
    path(r'',views.home,name='home'),
    path(r'game_details/<int:id>/',views.game_details,name='game_details'),
    path(r'blog/',views.blog,name='blogs'),
    path(r'games/',views.games,name='games'),
    path(r'contact/',views.contact,name='contact'),
    path(r'blog/single-blog',views.singleBlog,name='single-blog'),
    path(r'games/game_details/<int:id>/',views.game_details,name='one_game_details'),

]


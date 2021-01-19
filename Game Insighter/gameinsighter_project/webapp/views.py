from django.shortcuts import render
from .get_images import *
from .get_iframelinks import get_graphs
from .get_reviews import get_reviews
import requests
import json
import datetime
from .models import gameDetails

def home(request):
    graphs=get_graphs("all_game")
    return render(request,'index.html',graphs)

def game_details(request, id):
    gdobj=gameDetails.objects.filter(Steam_ID=id)
    sys_req_1=gdobj.values('System_Requirements')[0].get('System_Requirements').split("$")
    sys_req_1=[i.lstrip() for i in sys_req_1]
    sys_req_2=[i.split(":") for i in sys_req_1]
    sys_req=[j for j in sys_req_2 if len(j) == 2]
    sys_req=dict(sys_req)
    details={
        "Name": gdobj.values('Game_Title')[0].get('Game_Title'),
        "Genre": gdobj.values('Genre')[0].get('Genre'),
        "Release Date": gdobj.values('Release_Date')[0].get('Release_Date'),
        "Publisher": gdobj.values('Publisher')[0].get('Publisher'),
        "Languages": gdobj.values('Languages')[0].get('Languages'),
        "Description": gdobj.values('Descriptions')[0].get('Descriptions'),
        "images": get_images(id),
        "graphs": get_graphs(id)
    }
    return render(request, "game-details.html", {'details':details, 'sys_req':sys_req, 'get_reviews':get_reviews(id)})

def blog(request):
    return render(request, "blog.html")

def games(request):
    return render(request, "games.html")

def contact(request):
    return render(request, "contact.html")

def singleBlog(request):
    return render(request, "single-blog.html")

from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.urls import reverse
from urllib.parse import urlencode
from .models import Topic, Course, Student,User
from .forms import *
import datetime,smtplib,string,random

def index(request):
    top_list = Topic.objects.all().order_by('id')[:10]
    course_list = Course.objects.all().order_by('-price')[:5]
    if request.session.get('last_login',default=None) is None:
        login_time="Your last login was more than one hour ago"
    else:
        login_time=request.session.get('last_login')
    return render(request, 'myapp/index.html', {'top_list': top_list, 'course_list': course_list,'login_time':login_time})


def about(request):
    data = "This is an E-Learning WebApp! Search our Topics to find all available Courses."
    no_times = 1
    response = render(request, 'myapp/about.html', {'data': data,'visit':no_times})
    if request.COOKIES.get("about_visits", None) is None:
        response.set_cookie('about_visits', no_times, expires=300)
    else:
        cnt=request.COOKIES.get("about_visits")
        cnt=int(cnt)+1
        response= render(request, 'myapp/about.html', {'data': data, 'visit':cnt})
        response.set_cookie('about_visits', cnt, expires=300)
    return response


def detail(request, top_no):
    response = HttpResponse()
    topic = get_object_or_404(Topic, pk=top_no)
    all_courses = Course.objects.filter(topic__name=topic.name)
    return render(request, 'myapp/detail.html', {'topic': topic, 'all_courses': all_courses})


def courses(request):
    courlist = Course.objects.all().order_by('id')
    return render(request, 'myapp/courses.html', {'courlist': courlist})


def place_order(request):
    msg = ''
    courlist = Course.objects.all()
    if request.method == 'POST':
        form = OrderForm(request.POST)
        if form.is_valid():
            order = form.save(commit=False)
            if order.levels <= order.course.stages:
                if (order.course.price > 150.00):
                    Course.discount(order.course)
                order.save()
                msg = 'Your course has been ordered successfully.'
            else:
                msg = 'You exceeded the number of levels for this course.'
            return render(request, 'myapp/order_response.html', {'msg': msg})
    else:
        form = OrderForm()
    return render(request, 'myapp/placeorder.html', {'form': form, 'msg': msg, 'courlist': courlist})


def coursedetail(request, cour_id):
    courdetail = Course.objects.get(pk=cour_id)
    if request.method == 'POST':
        form = InterestForm((request.POST))
        if form.is_valid():
            if form['interested'] == 1:
                courdetail.interested = courdetail.interested + 1
                courdetail.save()
        return redirect('myapp:index')
    else:
        form = InterestForm()
        return render(request, 'myapp/coursedetail.html', {'form': form, 'courdetail': courdetail})


def user_login(request):
    context = {}
    context['form'] = loginForm()
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user:
            if user.is_active:
                login(request, user)
                user_object=User.objects.get(username=username)
                time = datetime.datetime.now()
                request.session['last_login']= str(time)
                request.session['u_id']=user_object.id
                # request.session.set_expiry(3600)
                if 'next' in request.POST:
                    next=request.POST.get('next')
                    return redirect('myapp:'+next)
                return HttpResponseRedirect(reverse('myapp:index'))
            else:
                return HttpResponse('Your account is disabled.')
        else:
            return HttpResponse('Invalid login details.')
    else:
        return render(request, 'myapp/login.html', context)


@login_required
def user_logout(request):
    del request.session['u_id']
    request.session.flush()
    return redirect('myapp:index')

def myaccount(request):
    current_user = request.user
    if request.user.is_authenticated:
        if not current_user.id == 1:
            first_name = current_user.first_name
            last_name = current_user.last_name
            ordered_course = Order.objects.filter(student_id=current_user.id).values_list('course__name', flat=True)
            interested = Student.objects.filter(id=current_user.id).values_list('interested_in__courses__name', flat=True)
            return render(request, 'myapp/myaccount.html',
                          {'ordered_course': ordered_course, 'first_name': first_name, 'last_name': last_name,
                           'interested': interested})
        else:
            return HttpResponse('You are not a registered student!')
    else:
        base_url=reverse('myapp:login')
        query_string=urlencode({'next':'myaccount'})
        url='{}?{}'.format(base_url,query_string)
        return redirect(url)

def register(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST, request.FILES)
        if form.is_valid():
            user=form.save(commit=False)
            password=form.cleaned_data['password']
            user.set_password(password)
            user.save()
            form.save()
            return redirect('myapp:login')
    form=RegisterForm()
    return render(request, 'myapp/register.html', {'form': form})

def password_reset_request(request):
    context=""
    if request.method == "POST":
        email = request.POST['email']
        std_obj=Student.objects.filter(email=email)
        if std_obj.exists():
            print("ok")
            s=smtplib.SMTP('smtp.gmail.com',587)
            s.starttls()
            s.login(emailid,passw)
            rand_password=''.join(random.choices(string.ascii_uppercase + string.ascii_lowercase+ string.digits, k=10))
            std_obj = Student.objects.get(email=email)
            std_obj.set_password(rand_password)
            std_obj.save()
            message="Your new password is: "+rand_password+". Please use this password to login again."
            print(message)
            s.sendmail(emailid,email,message)
            s.quit()
            return render(request,"myapp/password_send.html")
        else:
            context="Your email address was not found. Please try again!"
    return render(request,'myapp/password_reset.html',{'context':context})

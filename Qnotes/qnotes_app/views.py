from django.shortcuts import render , redirect
from django.contrib.auth.models import User
from django.http import HttpResponse
from django.template.response import TemplateResponse
from django.contrib.auth import logout as auth_logout
import pymongo
import smtplib
import datetime 

myclient=pymongo.MongoClient("mongodb://localhost:27017/")
mydb=myclient["Qnotes"]
mycol=mydb["notes"]
mycol1=mydb["counters"]
mycol2=mydb["todo"]
mycol3=mydb["todocounters"]
mycol4=mydb["users"]
mycol5=mydb["usercounters"]
mycol6=mydb["sharecounters"]
mycol7=mydb["sharenotes"]
list_todo = []


def welcome(request):
	return redirect("/index")


def index(request):
	return render(request,"index.html")


def logout(request):
	auth_logout(request)
	return redirect('/index')


def show_notes(request):
	uname = str(request.user)
	print(uname)
	if(uname != "AnonymousUser"):
		fname = str(request.user.first_name)
		lname = str(request.user.last_name)
		email = str(request.user.email)
		print("email : ",email)
		data1=mycol4.find({"uname":uname,"email":email}).count()
		if(data1 == 0):
			seq=mycol5.find_one({"id" : "uid"})
			y=seq['sequence_value']
			y=int(y)
			y=y+1
			myquery = {'id':"uid"}
			newvalues = { "$set": { "sequence_value": y } }
			mycol5.update_one(myquery, newvalues)
			data1={
			'id':y,
			'fname':fname,
			'lname':lname,
			'uname':uname,
			'email':email,
			}
			mycol4.insert_one(data1)
		data=mycol.find({"author":email}).sort("id",pymongo.DESCENDING)
		return render(request,"notes.html",{"data":data,"n_status":1})
	else:
		return redirect('/index')

def create_notes(request):
	user=str(request.user)
	if(user != "AnonymousUser"):
		title=request.POST.get('title')
		content=request.POST.get('content')
		cd=datetime.datetime.now()
		created_date=cd.strftime("%Y-%m-%d %H:%M")
		last_edited=cd.strftime("%Y-%m-%d %H:%M")
		user=str(request.user)
		email=request.user.email	
		seq=mycol1.find_one({"id" : "noteid"})
		y=seq['sequence_value']
		y=int(y)
		y=y+1
		myquery = {'id':"noteid"}
		newvalues = { "$set": { "sequence_value": y } }
		mycol1.update_one(myquery, newvalues)
		data={
		'id':y,
		'title':title,
		'content':content,
		'author': email,
		'fav_flag':0,
		'arc_flag':0,
		'note_colour':'#99ff99',
		'created_date':created_date,
		'last_edited':last_edited,

		}
		mycol.insert_one(data)
		data=mycol.find({"author":email}).sort("id",pymongo.DESCENDING)
		return render(request,"notes.html",{"data":data,"n_status":1})
	else:
		return redirect('/index')


def edit_note(request,id):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		myquery={"id":nid,"author":email}
		data=mycol.find_one(myquery)
		return render(request,"edit_note.html",{"data":data,"n_status":1})
	else:
		return redirect('/index')


def update_note(request):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		nid=request.POST.get('id')
		nid=int(nid)
		etitle=request.POST.get('etitle')
		econtent=request.POST.get('econtent')
		cd=datetime.datetime.now()
		last_edited=cd.strftime("%Y-%m-%d %H:%M")
		mycol.update_one({"id":nid}, { "$set": {"title":etitle, "content":econtent,"last_edited":last_edited }})
		data=mycol.find({"author":email}).sort("id",pymongo.DESCENDING)
		return render(request,"notes.html",{"data":data,"n_status":1})
	else:
		return redirect('/index')


def delete_note(request,id):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		mycol.delete_one({"id":nid}) 
		data=mycol.find({"author":email}).sort("id",pymongo.DESCENDING)
		return render(request,"notes.html",{"data":data,"n_status":1})
	else:
		return redirect('/index')


def goto_search_note(request):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		return render(request,"search.html",{"s_status":1})
	else:
		return redirect('/index')


def search_note(request):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		searchstr=request.POST.get("title")
		searchstr=searchstr.lower()
		cb=request.POST.get("checkbox1")
		user=str(request.user)
		email=request.user.email
		#print("check box value : ",cb)
		temp=[]

		if(cb == "on"):
			#print("check box value : ",cb)
			data=mycol.find({"author":email,"fav_flag":1})
			count=mycol.find({"author":email,"fav_flag":1}).count()
			for i in range(count):
				stemp= data[i].get('title')
				stemp=stemp.lower()
				if(stemp.__contains__(searchstr)):
					temp.append(data[i])
			#print(temp)

		else:
			#print("check box value : ",cb)
			data=mycol.find({"author":email,"fav_flag":0,"arc_flag":0})
			count=mycol.find({"author":email,"fav_flag":0,"arc_flag":0}).count()
			print(data)
			for i in range(count):
				stemp= data[i].get('title')
				stemp=stemp.lower()
				if(stemp.__contains__(searchstr)):
					temp.append(data[i])
			#print(temp)
		return render(request,"search.html",{"data":temp,"s_status":1})
	else:
		return redirect('/index')


def colour_change1(request,id):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		mycol.update_one({"id":nid}, { "$set": {"note_colour":" #ffff66" }})
		data=mycol.find({"author":email}).sort("id",pymongo.DESCENDING)
		return render(request,"notes.html",{"data":data,"n_status":1})
	else:
		return redirect('/index')


def colour_change2(request,id):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		mycol.update_one({"id":nid}, { "$set": {"note_colour":"#99ff99" }})
		data=mycol.find({"author":email}).sort("id",pymongo.DESCENDING)
		return render(request,"notes.html",{"data":data,"n_status":1})
	else:
		return redirect('/index')

def colour_change4(request,id):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		mycol.update_one({"id":nid}, { "$set": {"note_colour":"#d7aefb" }})
		data=mycol.find({"author":email}).sort("id",pymongo.DESCENDING)
		return render(request,"notes.html",{"data":data,"n_status":1})
	else:
		return redirect('/index')


def colour_change5(request,id):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		mycol.update_one({"id":nid}, { "$set": {"note_colour":"#99d6ff" }})
		data=mycol.find({"author":email}).sort("id",pymongo.DESCENDING)
		return render(request,"notes.html",{"data":data,"n_status":1})
	else:
		return redirect('/index')

def colour_change6(request,id):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		mycol.update_one({"id":nid}, { "$set": {"note_colour":"#f28b82" }})
		data=mycol.find({"author":email}).sort("id",pymongo.DESCENDING)
		return render(request,"notes.html",{"data":data,"n_status":1})
	else:
		return redirect('/index')

def colour_change7(request,id):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		mycol.update_one({"id":nid}, { "$set": {"note_colour":"#cccccc" }})
		data=mycol.find({"author":email}).sort("id",pymongo.DESCENDING)
		return render(request,"notes.html",{"data":data,"n_status":1})
	else:
		return redirect('/index')

def colour_change8(request,id):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		mycol.update_one({"id":nid}, { "$set": {"note_colour":"#fdcfe8" }})
		data=mycol.find({"author":email}).sort("id",pymongo.DESCENDING)
		return render(request,"notes.html",{"data":data,"n_status":1})
	else:
		return redirect('/index')

def fav_note(request,id):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		mycol.update_one({"id":nid}, { "$set": {"fav_flag":1 }})
		favdata=mycol.find({"fav_flag" : 1,"author":email}).sort("id",pymongo.DESCENDING)
		return render(request,"favourites.html",{'favdata':favdata,"f_status":1})
	else:
		return redirect('/index')

def show_fav(request):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		favdata=mycol.find({"fav_flag" : 1,"author":email,"arc_flag":0}).sort("id",pymongo.DESCENDING)
		return render(request,"favourites.html",{'favdata':favdata,"f_status":1})
	else:
		return redirect('/index')

def unfav(request,id):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		mycol.update_one({"id":nid}, { "$set": {"fav_flag":0 }})
		favdata=mycol.find({"author":email}).sort("id",pymongo.DESCENDING)
		return render(request,"notes.html",{'data':favdata,"n_status":1})
	else:
		return redirect('/index')

def archive_note(request,id):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		mycol.update_one({"id":nid}, { "$set": {"arc_flag":1 }})
		arcdata=mycol.find({"author":email}).sort("id",pymongo.DESCENDING)
		return render(request,"notes.html",{'data':arcdata,"n_status":1})
	else:
		return redirect('/index')

def undo_archive(request,id):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		mycol.update_one({"id":nid}, { "$set": {"arc_flag":0 }})
		arcdata=mycol.find({"author":email}).sort("id",pymongo.DESCENDING)
		return render(request,"notes.html",{'data':arcdata,"n_status":1})
	else:
		return redirect('/index')

def show_archive(request):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		arcdata=mycol.find({"arc_flag" : 1,"author":email}).sort("id",pymongo.DESCENDING)
		return render(request,"archive.html",{'arcdata':arcdata,"a_status":1})
	else:
		return redirect('/index')

def show_todo(request):
	user=str(request.user)
	if(user != "AnonymousUser"):
		email=request.user.email
		temp={"0"}
		dic={}
		fl=[]
		main_id=[]
		for i in mycol2.find({},{"_id":0,"id":1,"author":1}):
			#print(i)
			temp.add(i.get('id'))
		temp.remove("0")
		for x in temp:
			t1=[]
			main_id.append(x)
			for i in mycol2.find({"id":x,"author":email}):
				t1.append(i)
			fl.append(t1)
		return render(request,'todo_list.html',{'data':fl,'mainid':main_id,"t_status":1})
	else:
		return redirect("/index")


def goto_todo(request):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		return render(request,'create_todo.html',{"t_status":1})
	else:
		return redirect('/index')

def create_todo(request):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		global list_todo
		con=request.POST.get('todocont')
		list_todo.append(con)
		#print(con)
		data=mycol2.find({"author":email})
		return render(request,"create_todo.html",{'data':list_todo,"t_status":1})
	else:
		return redirect('/index')

def insert_todo(request):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		cd=datetime.datetime.now()
		created_date=cd.strftime("%Y-%m-%d %H:%M")
		seq=mycol1.find_one({"id" : "noteid"})
		y=seq['sequence_value']
		y=int(y)
		y=y+1
		myquery = {'id':"noteid"}
		newvalues = { "$set": { "sequence_value": y } }
		mycol1.update_one(myquery, newvalues)
		for td in range(len(list_todo)):
			seq1=mycol3.find_one({"id" : "tid"})
			q=seq1['sequence_value']
			q=int(q)
			q=q+1	
			myquery = {'id':"tid"}
			newvalues = { "$set": { "sequence_value": q } }
			mycol3.update_one(myquery, newvalues)
			data={  'id':y,
					'tid':q,
					"content":list_todo[td],
					"author":email,
					"created_date":created_date,
				 }
			mycol2.insert_one(data)
		list_todo.clear()
		temp={"0"}
		dic={}
		fl=[]
		for i in mycol2.find({},{"_id":0,"id":1,"author":1}):
			temp.add(i.get('id'))
		temp.remove("0")
		for x in temp:
			t1=[]
			for i in mycol2.find({"id":x,"author":email}):
				#print(i)
				t1.append(i)
			fl.append(t1)
		return render(request,'todo_list.html',{'data':fl,"t_status":1})
	else:
		return redirect('/index')

def add_todogoto(request,id):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		myquery={"id":nid}
		return render(request,"update_todo.html",{"data":myquery,"t_status":1})
	else:
		return redirect('/index')

def update_todo(request):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		nid=request.POST.get('idtodo')
		nid=int(nid)
		content=request.POST.get('todocont')
		cd=datetime.datetime.now()
		created_date=cd.strftime("%Y-%m-%d %H:%M")
		seq1=mycol3.find_one({"id" : "tid"})
		q=seq1['sequence_value']
		q=int(q)
		q=q+1	
		myquery = {'id':"tid"}
		newvalues = { "$set": { "sequence_value": q } }
		mycol3.update_one(myquery, newvalues)
		data={'id':nid,'tid':q,"content":content,"author":email,"created_date":created_date}
		mycol2.insert_one(data)		
		temp={"0"}
		dic={}
		fl=[]
		for i in mycol2.find({},{"_id":0,"id":1,"author":1}):
			temp.add(i.get('id'))
		temp.remove("0")
		for x in temp:
			t1=[]
			for i in mycol2.find({"id":x,"author":email}):
				#print(i)
				t1.append(i)
			fl.append(t1)	
		return render(request,'todo_list.html',{'data':fl,"t_status":1})
	else:
		return redirect('/index')


def delete_todo(request,id):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		mycol2.delete_one({"tid":nid})
		temp={"0"}
		dic={}
		fl=[]
		for i in mycol2.find({},{"_id":0,"id":1,"author":1}):
			temp.add(i.get('id'))
		temp.remove("0")
		for x in temp:
			t1=[]
			for i in mycol2.find({"id":x,"author":email}):
				#print(i)
				t1.append(i)
			fl.append(t1)	
		return render(request,'todo_list.html',{'data':fl,"t_status":1})
	else:
		return redirect('/index')


def show_sharednotes(request):
	user=str(request.user)
	if(user != "AnonymousUser"):
		email=request.user.email
		data1=mycol7.find({"author":email})
		data2=mycol7.find({"sub_author":email})
		return render(request,"shared_notes.html",{'share_status':1,"data1":data1,"data2":data2})
	else:
		return redirect('/index')


def post_groupnote(request,id):
	user=str(request.user)
	if(user != "AnonymousUser"):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		myquery={"id":nid,"author":email}
		data=mycol.find_one(myquery)
		return render(request,"group_email.html",{'share_status':1,'data':data})
	else:
		return redirect('/index')

def sendemail(from_addr, to_addr_list, cc_addr_list,subject, message,login, password,smtpserver='smtp.gmail.com:587'):
    header = 'From: %s\n' % from_addr
    header += 'To: %s\n' % ','.join(to_addr_list)
    header += 'Cc: %s\n' % ','.join(cc_addr_list)
    header += 'Subject: %s\n\n' % subject
    message = header + message
 
    server = smtplib.SMTP(smtpserver)
    server.starttls()
    server.login(login,password)
    problems = server.sendmail(from_addr, to_addr_list, message)
    server.quit()
    return problems


def group_note(request):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		nid=request.POST.get("id")
		email=request.POST.get("example_emailSUI")
		email=email.replace('"','')
		email=email.replace('[','')
		email=email.replace(']','')
		print("new email",email)
		note_colour= request.POST.get("note_colour")
		title=request.POST.get("title")
		content=request.POST.get("content")
		email=email.replace("","")
		sub_author = email.split(",")
		cd=datetime.datetime.now()
		created_date=cd.strftime("%Y-%m-%d %H:%M")
		last_edited=cd.strftime("%Y-%m-%d %H:%M")
		seq=mycol6.find_one({"id" : "sid"})
		y=seq['sequence_value']
		y=int(y)
		y=y+1
		myquery = {'id':"sid"}
		newvalues = { "$set": { "sequence_value": y } }
		email1=request.user.email
		mycol6.update_one(myquery, newvalues)
		data={
		'sid':y,
		'id':nid,
		'title':title,
		'content':content,
		'author': email1,
		'sub_author':sub_author,
		'note_colour':note_colour,
		'created_date':created_date,
		'last_edited':last_edited,
		'last_edited_by':email1,
		}
		mycol7.insert_one(data)
		sender="qnotesproject@gmail.com"
		password="Qnotes@123"
		fname=request.user.first_name
		subject = fname+" shared a note with you - Check"
		msg1= fname+" ("+email1+") shared a note with you.Check now. "
		msg2= "127.0.0.1:8000/"
		frm=sender
		to=[]
		to=sub_author
		cc= []
		sub=subject
		msg= msg1+msg2
		lgn= sender
		pwd=password
		sendemail(from_addr = frm , to_addr_list = to ,cc_addr_list = cc, subject = sub , message =msg , login = lgn, password = pwd)
		data1=mycol7.find({"author":email1})
		data2=mycol7.find({"sub_author":email1})
		return render(request,"shared_notes.html",{'share_status':1,"data1":data1,"data2":data2})
	else:
		return redirect('/index')

def delete_sharednote(request,id):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		print(nid)
		mycol7.delete_one({"sid":nid}) 
		data1=mycol7.find({"author":email})
		data2=mycol7.find({"sub_author":email})
		return render(request,"shared_notes.html",{"share_status":1,"data1":data1,"data2":data2})
	else:
		return redirect('/index')

def search_sharednote(request):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		title=request.POST.get("shared_title")
		title=title.lower()
		temp1=[]
		temp2=[]
		data1=mycol7.find({"author":email})
		count1=mycol7.find({"author":email}).count()
		data2=mycol7.find({"sub_author":email})
		count2=mycol7.find({"sub_author":email}).count()
		for i in range(count1):
			stemp= data1[i].get('title')
			stemp=stemp.lower()
			if(stemp.__contains__(title)):
				temp1.append(data1[i])
		for i in range(count2):
			stemp= data2[i].get('title')
			stemp=stemp.lower()
			if(stemp.__contains__(title)):
				temp2.append(data2[i])
		return render(request,"shared_notes.html",{"share_status":1,"data1":temp1,"data2":temp2})
	else:
		return redirect('/index')

def edit_sharednote(request,id):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		myquery={"sid":nid,"author":email}
		data=mycol7.find_one(myquery)
		return render(request,"edit_sharednote.html",{"data":data,"share_status":1})
	else:
		return redirect('/index')


def edit_subauthorsharednote(request,id):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		path=request.get_full_path()
		path=path.split('/')
		nid=path[2]
		nid=int(nid)
		myquery={"sid":nid,"sub_author":email}
		data=mycol7.find_one(myquery)
		return render(request,"edit_sharednote.html",{"data":data,"share_status":1})
	else:
		return redirect('/index')


def update_sharednote(request):
	user=str(request.user)
	if( user != "AnonymousUser" ):
		email=request.user.email
		nid=request.POST.get('sid')
		nid=int(nid)
		etitle=request.POST.get('etitle')
		econtent=request.POST.get('econtent')
		cd=datetime.datetime.now()
		last_edited=cd.strftime("%Y-%m-%d %H:%M")
		mycol7.update_one({"sid":nid}, { "$set": {"title":etitle, "content":econtent ,'last_edited':last_edited,"last_edited_by":email}})
		data1=mycol7.find({"author":email})
		data2=mycol7.find({"sub_author":email})
		return render(request,"shared_notes.html",{'share_status':1,"data1":data1,"data2":data2})
	else:
		return redirect('/index')
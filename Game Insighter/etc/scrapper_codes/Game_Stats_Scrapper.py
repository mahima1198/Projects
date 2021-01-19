import requests,openpyxl
from bs4 import BeautifulSoup

def retrive_stats(filename,game_id):
    g_lat_stats={}
    r=requests.get("https://steamcharts.com/app/"+str(game_id))
    c=r.content
    soup=BeautifulSoup(c,"html.parser")
    g_crnt_stats=soup.find_all("span",{"class": "num"})
    
    g_crnt_stats_list=[["Month"],["Avg Players"],["Peak Players"],]
    g_lat_stats={"Hour Ago":g_crnt_stats[0].text,"24 Hour Peak":g_crnt_stats[1].text,"Max Player":g_crnt_stats[2].text}

    g_crnt_stats=soup.find("td",{"class":"month-cell left italic"})
    g_crnt_stats_list[0].append(g_crnt_stats.text)
    g_crnt_stats=soup.find_all("td",{"class":"month-cell left"})
    for i in g_crnt_stats:
        temp=(i.text).replace("\t","")
        temp=temp.replace("\n","")
        g_crnt_stats_list[0].append(temp)
    
    g_crnt_stats=soup.find("td",{"class":"right num-f italic"})
    g_crnt_stats_list[1].append(g_crnt_stats.text)
    g_crnt_stats=soup.find_all("td",{"class":"right num-f"})
    for i in g_crnt_stats:
        temp=(i.text).replace("\t","")
        temp=temp.replace("\n","")
        g_crnt_stats_list[1].append(temp)

    g_crnt_stats=soup.find("td",{"class":"right num italic"})
    g_crnt_stats_list[2].append(g_crnt_stats.text)
    g_crnt_stats=soup.find_all("td",{"class":"right num"})
    for i in g_crnt_stats:
        temp=(i.text).replace("\t","")
        temp=temp.replace("\n","")
        g_crnt_stats_list[2].append(temp)
    g_crnt_stats_list[2]
    
    store_stats(filename,g_lat_stats,g_crnt_stats_list)

def store_stats(filename,g_lat_stats,g_crnt_stats_list):
    wb2=openpyxl.load_workbook(filename)
    sh2=wb2.active
    row=1
    sh2.cell(row=1,column=7).value="Hour Ago"
    sh2.cell(row=1,column=8).value="24 Hour Peak"
    sh2.cell(row=1,column=9).value="Max Player"
    sh2.cell(row=2,column=7).value=g_lat_stats["Hour Ago"]
    sh2.cell(row=2,column=8).value=g_lat_stats["24 Hour Peak"]
    sh2.cell(row=2,column=9).value=g_lat_stats["Max Player"]
    
    for i in range(0,len(g_crnt_stats_list[1])):
        sh2.cell(row=row,column=4).value=g_crnt_stats_list[0][i]
        sh2.cell(row=row,column=5).value=g_crnt_stats_list[1][i]
        sh2.cell(row=row,column=6).value=g_crnt_stats_list[2][i]
        row=row+1
    wb2.save(filename)
    print("Stored for ::",filename)

wb1=openpyxl.load_workbook("games_id_names.xlsx")
sh1=wb1.active
for i in range(2,(sh1.max_row+1)):
    game_name=(sh1.cell(row=i,column=1)).value
    game_id=(sh1.cell(row=i,column=2)).value
    filename=game_name+" Stats.xlsx"
    retrive_stats(filename,game_id)
    print(filename)

from django.contrib import admin
from django.urls import path, include
from . import views

urlpatterns = [

    #Social Login Through Google
    path('', include('social_django.urls', namespace='social')),
    
    #indexes
    path('',views.welcome,name='welcome'),
    path('index/',views.index,name="index"),
    path('logout/',views.logout,name='logout'),

    #Notes
    path('show_notes/', views.show_notes, name='show_notes'),
    path('create_notes/',views.create_notes,name='create_notes'),
    path('edit_note/<int:id>/',views.edit_note,name='edit_note'),
    path('update_note/',views.update_note,name='update_note'),
    path('delete_note/<int:id>/',views.delete_note,name='delete_note'),
    path('goto_search_note/', views.goto_search_note, name='goto_search_note'),
    path('search_note/', views.search_note, name='search_note'),


    #Notes Color
    path('colour_change1/<int:id>/',views.colour_change1,name='colour_change1'),
    path('colour_change2/<int:id>/',views.colour_change2,name='colour_change2'),
    #path('colour_change3/<int:id>/',views.colour_change3,name='colour_change3'),
    path('colour_change4/<int:id>/',views.colour_change4,name='colour_change4'),
    path('colour_change5/<int:id>/',views.colour_change5,name='colour_change5'),
    path('colour_change6/<int:id>/',views.colour_change6,name='colour_change6'),
    path('colour_change7/<int:id>/',views.colour_change7,name='colour_change7'),
    path('colour_change8/<int:id>/',views.colour_change8,name='colour_change8'),

    #Favourite Notes
    path('fav_note/<int:id>/',views.fav_note,name='fav_note'),
    path('show_fav/',views.show_fav,name='show_fav'),
    path('unfav/<int:id>/',views.unfav,name='unfav'),

    #Archive Notes
    path('archive_note/<int:id>/',views.archive_note,name='archive_note'),
    path('undo_archive/<int:id>/',views.undo_archive,name='undo_archive'),
    path('show_archive/',views.show_archive,name='show_archive'),

    #TODO
    path('show_todo/',views.show_todo,name='show_todo'),
    path('goto_todo/',views.goto_todo,name='goto_todo'),
    path('create_todo/',views.create_todo,name='create_todo'),
    path('insert_todo/',views.insert_todo,name='insert_todo'),
    path('add_todogoto/<int:id>/',views.add_todogoto,name='add_todogoto'),
    path('update_todo/',views.update_todo,name='update_todo'),
    path('delete_todo/<int:id>/',views.delete_todo,name='delete_todo'),

    #Share Notes
    path('show_sharednotes/', views.show_sharednotes, name='show_sharednotes'),
    path('post_groupnote/<int:id>/', views.post_groupnote, name='post_groupnote'),
    path('group_note/',views.group_note,name='group_note'),
    path('delete_sharednote/<int:id>/',views.delete_sharednote,name='delete_sharednote'),
    path('search_sharednote/', views.search_sharednote, name='search_sharednote'),
    path('edit_sharednote/<int:id>/',views.edit_sharednote,name='edit_sharednote'),
    path('update_sharednote/',views.update_sharednote,name='update_sharednote'),
    path('edit_subauthorsharednote/<int:id>/',views.edit_subauthorsharednote,name='edit_subauthorsharednote'),
    
]
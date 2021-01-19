#! /bin/bash 
gunicorn --chdir /gameinsighter_project --bind 0.0.0.0:8000 gameinsighter.wsgi
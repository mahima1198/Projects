from flask import Flask, render_template
import sqlite3 as lite
from get_images import get_images
from get_iframelinks import get_graphs
from get_reviews import get_reviews
import requests
import json
import datetime

app = Flask(__name__)
con = lite.connect('Game Details.db',check_same_thread=False)


@app.route('/', methods=['GET', 'POST'])
def home():
    return render_template('index.html',graphs= get_graphs("all_game"))


@app.route("/game-details/<id>", methods=['GET', 'POST'])
def game_details(id):
    with con:
        cur = con.cursor()
        cur.execute("SELECT * from game_details WHERE Steam_ID=?", (id,))
        row = cur.fetchone()
        x = row[9].split("$")
        z = [i.split(":") for i in x]
        zz = [j for j in z if len(j) == 2]
        system_requirements = dict(zz)
        details = {
            "Name": row[1],
            "Genre": row[2],
            "Release Date": row[3],
            "Publisher": row[4],
            "Languages": row[6],
            "Description": row[7],
            "images": get_images(id),
            "graphs": get_graphs(id)
        }
    print(details)
    con.commit()
    return render_template('game-details.html',details=details,sr=system_requirements,reviews=get_reviews(id))

@app.route('/blog', methods=['GET', 'POST'])
def blog():
    return render_template('blog.html')


@app.route('/games', methods=['GET', 'POST'])
def games():
    return render_template('games.html')


@app.route('/contact', methods=['GET', 'POST'])
def contact():
    return render_template('contact.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    return render_template('login.html')

@app.route('/tournaments', methods=['GET', 'POST'])
def tournaments():
    url = "https://api.pandascore.co/tournaments/upcoming/"
    parameters = {'token': 'swo0EccmzBYEsymM3PmPxCp5PsX52ytBf7n_mdX-ov7WKCeYNWk', 'per_page': '10'}
    r2 = requests.get(url=url, params=parameters)
    tdata = json.loads(r2.content.decode('utf-8'))
    t_data = []
    temp = {}
    for i in tdata:
        dt= datetime.datetime.strptime((i.get('begin_at').split('T')[0]),'%Y-%m-%d').strftime('%m/%d/%y')
        temp = {'begin': dt , 'league_image': i.get('league').get('image_url'),
                'league_name': i.get('league').get('name'), 'videogame_name': i.get('videogame').get('name')}
        t_data.append(temp)
        temp = {}
    print(t_data)
    return render_template('tournaments.html', tournaments=t_data)


@app.route('/register', methods=['GET', 'POST'])
def register():
    return render_template('register.html')


if __name__ == '__main__':
    app.run(debug=True)

import os
import pandas as pd


def get_reviews(steam_id):
    file_name={"271590":"Grand Theft Auto V", "812140":"Assassin's Creed Odyssey", "578080":"PUBG", "552520":"Far Cry 5", "252950":"Rocket League", "466560":"Northgard", "730":"Counter Strike Global offensive", "359550":"Tom Clancy's Rainbow Six Siege", "346110":"ARK Survival Evolved", "704270":"Generation Zero", "381210":"Dead by Daylight", "252490":"Rust"}
    x=file_name[str(steam_id)]
    x=x+".xlsx"
    workd = os.getcwd()

    f_loc = os.path.join(workd, r"webapp/static/webapp/Excel Files")
    path_name = os.path.join(f_loc,x)
    print(path_name)
    review_data = pd.read_excel(path_name)
    count = 0
    r_list = []
    temp = {}
    for i in range(len(review_data)):
        if (count == 7):
            break
        temp.update({'user_name': review_data['user_name'][count], 'review': review_data['review'][count],
                     'review_date': review_data['review_date'][count]})
        r_list.append(temp)
        temp = {}
        count = count + 1

    return r_list


from os import getenv
from datetime import date, timedelta
from notion_client import Client
from dotenv import load_dotenv

load_dotenv("./.env.local")

timeDelta = 7
date_today = date.today()

horaires = [
    ["21H-6H", "22H-6H", "22H-6H", "REPOS", "REPOS", "REPOS", "REPOS"], 
    ["3H-12H", "14H-22H", "REPOS", "22H-6H", "23H-8H", "REPOS", "REPOS"], 
    ["12H-21H", "REPOS", "14H-22H", "14H-22H", "14H-22H", "REPOS", "REPOS"], 
    ["REPOS", "6H-14H", "6H-14H", "6H-14H", "6H-14H", "8H-13H", "REPOS"], 
]

database_id = getenv("NOTION_DATABASE")

notion = Client(auth=getenv("NOTION_KEY"))

def add_page(title, date):
    parent = {
            "type": "database_id",
            "database_id": database_id
    }
    properties = {
        "Nom":{
            "title":[{"text": {"content":title}}]
        },
        "Date": {"date": {"start":date}}
    }
    title = [{"type": "text", "text": {"content": ""}}]
    notion.pages.create(parent=parent, title=title, properties=properties)

def main(): 
    # Boucle sur le nombre de semaines désirées
    for d in range(0, 2):
        daysValue = d*timeDelta
        baseDate = date_today + timedelta(days=daysValue) 
        horaires_semaine_courante = horaires[d%len(horaires)]

        # De Lundi à Dimanche
        for k in range(0,7):
            date_value = baseDate + timedelta(days=k)
            horaire = horaires_semaine_courante[k]
            add_page(horaire, date_value.isoformat())

#main()

#!/bin/sh

# Nom : Script generaux pour gitlab
# Auteur : Gaëtan Ritel

##### LABELS
# Bug #D9534F
# Doing #5CB85C
# Epic #5843AD
# High #FF0000
# In Review #34495E
# Low #5CB85C
# Rejected #7F8C8D
# To Do #F0AD4E
# User Story #428BCA
# Medium #F0AD4E
# 
# projectid : 17129645

labels = {
'Bug' : '#D9534F',
'Doing' : '#5CB85C',
'Epic' : '#5843AD',
'High' : '#FF0000',
'In Review' : '#34495E',
'Low' : '#5CB85C',
'Rejected' : '#7F8C8D',
'To Do' : '#F0AD4E',
'User Story' : '#428BCA',
'Medium' : '#F0AD4E',
}

if [ "$1" == "" ] || [ "$1" == "--help" ];then
	echo "
	Options :
		--defaults-labels : Crée labels par defaults
        --info : Affiche cette aide
	"
fi

if [ "$1" == "--defaults-labels" ];then
    project_id = "17129645"
    name_label = "test"
    color_label = "#5843AD"
    # curl --data "name=feature&color=#5843AD" --header `PRIVATE-TOKEN: s1hdvhJWybMuP1oynRM5` `https://gitlab.com/api/v4/projects/$(project_id)/labels`
    # echo 'https://gitlab.com/api/v4/projects/$(project_id)/labels'
    # echo 'PRIVATE-TOKEN: ${cat access_token.txt}'
    # echo 'name=${name_label&color}=${color_label}'
fi


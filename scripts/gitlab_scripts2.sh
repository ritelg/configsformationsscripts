#!/bin/bash

# Nom : Script generaux pour gitlab
# Auteur : Gaëtan Ritel

if [ "$1" == "&" ] || [ "$1" == "--help" ];then
	echo "
	Options :
		--defaults-labels : Crée labels par defaults
        --info : Affiche cette aide
	"
fi

if [ "$1" == "" ];then
	labels={
		'Bug':'#D9534F',
		'Doing':'#5CB85C',
		'Epic':'#5843AD',
		'High':'#FF0000',
		'In Review':'#34495E',
		'Low':'#5CB85C',
		'Rejected':'#7F8C8D',
		'To Do':'#F0AD4E',
		'User Story':'#428BCA',
		'Medium':'#F0AD4E'}
    project_id="3"
    name_label="test"
    color_label="#5843AD"
	curl --data "name=$name_label&color=$color_label" --header "PRIVATE-TOKEN: $(cat ./access_token.txt)" "https://localhost:8082/api/v4/projects/$(project_id)/labels"


    echo "https://gitlab.com/api/v4/projects/$project_id/labels"
	echo "PRIVATE-TOKEN: $(cat ./access_token.txt)"
    echo "name=$name_label&color=$color_label"
fi

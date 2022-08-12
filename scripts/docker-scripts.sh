#!/bin/bash - 
#===============================================================================
#
#          FILE: docker-scripts.sh
# 
#         USAGE: bash docker-scripts.sh
# 
#   DESCRIPTION: 
# 
#   OPTIONS: 
#		--help: Affiche l’aide
#		--fedora: Lance l’installation pour Fedora 
#		--debian: Lance l’installation pour Debian
#
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Gaëtan Ritel, 
#       CREATED: 2022-01-15 18:57:18
#      REVISION:  
#===============================================================================

help() {
	echo "
		--help: Affiche cette aide
		--portainer: Lance un conteneur portainer pour gerer les conteneurs

	"
}

dropNodes(){
	echo "Suppression des conteneurs..."
	docker rm -f $(docker ps -a | grep $USER-debian | awk '{print $1}')
	echo "Fin de la suppression"
}

infosNodes(){
	echo ""
	echo "Informations des conteneurs : "
	echo ""
	for conteneur in $(docker ps -a | grep $USER-debian | awk '{print $1}');do      
		docker inspect -f '   => {{.Name}} - {{.NetworkSettings.IPAddress }}' $conteneur
	done
	echo ""
}

if ["$1" == "--portainer"];then
	echo "Création du container portainer"
	docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

elif [ "$1" == "--drop" ];then
	dropNodes

elif ["$1" == "--infos"];then
	infosNodes
else
	help
fi

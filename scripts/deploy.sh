#!/bin/bash

############################################################
#
#  Description : déploiement à la volée de conteneur docker
#
#  Auteur : Xavier
#
#  Date : 28/12/2018 - V2.0
#
###########################################################


help(){
echo "

Options :
		- --create-debian : lancer des conteneurs debian
		- --create-fedora : lancer des conteneurs fedora

		- --drop: supprimer les conteneurs debian et fedora créer par le deploy.sh
		- --drop-debian : supprimer les conteneurs debian créer par le deploy.sh
		- --drop-fedora : supprimer les conteneurs fedora créer par le deploy.sh
	
		- --infos : caractéristiques des conteneurs (ip, nom, user...)

		- --start-debian : redémarrage des conteneurs debian
		- --start-fedora : redémarrage des conteneurs fedora

		- --ansible : déploiement arborescence ansible

"

}

createNodes() {
	# définition du nombre de conteneur
	nb_machine=1
	[ "$1" != "" ] && nb_machine=$1
	
	[ "$2" == "debian" ] && image="ritelg/debian:10-systemd"
	[ "$2" == "fedora" ] && image="ritelg/fedora:35-systemd"
	# setting min/max
	min=1
	max=0

	# récupération de idmax
	idmax=`docker ps -a --format '{{ .Names}}' | awk -F "-" -v user="$USER" '$0 ~ user-$2 {print $3}' | sort -r |head -1`
	# redéfinition de min et max
	min=$(($idmax + 1))
	max=$(($idmax + $nb_machine))

	# lancement des conteneurs
	for i in $(seq $min $max);do
		docker run -tid --privileged --publish-all=true -v /srv/data:/srv/html -v /sys/fs/cgroup:/sys/fs/cgroup:ro --name $USER-$2-$i -h $USER-$2-$i $image
		docker exec -ti $USER-$2-$i /bin/sh -c "useradd -m -p sa3tHJ3/KuYvI $USER"
		docker exec -ti $USER-$2-$i /bin/sh -c "mkdir  ${HOME}/.ssh && chmod 700 ${HOME}/.ssh && chown $USER:$USER $HOME/.ssh"
	docker cp $HOME/.ssh/id_rsa_docker_dev.pub $USER-$2-$i:$HOME/.ssh/authorized_keys
	docker exec -ti $USER-$2-$i /bin/sh -c "chmod 600 ${HOME}/.ssh/authorized_keys && chown $USER:$USER $HOME/.ssh/authorized_keys"
		docker exec -ti $USER-$2-$i /bin/sh -c "echo '$USER   ALL=(ALL) NOPASSWD: ALL'>>/etc/sudoers"
		docker exec -ti $USER-$2-$i /bin/sh -c "service ssh start"
		echo "Conteneur $USER-$2-$i créé"
	done
	infosNodes	

}

dropNodes(){
	echo "Suppression des conteneurs $1 ..."
	for conteneur in $(docker ps -a | grep $USER-$1 | awk '{print $1}');do
		docker rm -f $conteneur
	done
	echo "Fin de la suppression"
}

startNodes(){
	echo ""
	docker start $(docker ps -a | grep $USER-$1 | awk '{print $1}')
	for conteneur in $(docker ps -a | grep $USER-$1 | awk '{print $1}');do
		docker exec -ti $conteneur /bin/sh -c "service ssh start"
	done
	echo ""
}


createAnsible(){
	echo ""
  	ANSIBLE_DIR="ansible_dir"
  	mkdir -p $ANSIBLE_DIR
  	echo "all:" > $ANSIBLE_DIR/00_inventory.yml
	echo "  vars:" >> $ANSIBLE_DIR/00_inventory.yml
    echo "    ansible_python_interpreter: /usr/bin/python3" >> $ANSIBLE_DIR/00_inventory.yml
  echo "  hosts:" >> $ANSIBLE_DIR/00_inventory.yml
  for conteneur in $(docker ps -a | grep $USER-debian | awk '{print $1}');do      
    docker inspect -f '    {{.NetworkSettings.IPAddress }}:' $conteneur >> $ANSIBLE_DIR/00_inventory.yml
  done
  mkdir -p $ANSIBLE_DIR/host_vars
  mkdir -p $ANSIBLE_DIR/group_vars
	echo ""
}

infosNodes(){
	echo ""
	echo "Informations des conteneurs des conteneurs debian: "
	echo ""
	for conteneur in $(docker ps -a | grep $USER-debian | awk '{print $1}');do      
		docker inspect -f '   => {{.Name}} - {{.NetworkSettings.IPAddress }}' $conteneur
	done
	echo ""
	echo ""
	echo "Informations des conteneurs des conteneurs fedora: "
	echo ""
	for conteneur in $(docker ps -a | grep $USER-fedora | awk '{print $1}');do      
		docker inspect -f '   => {{.Name}} - {{.NetworkSettings.IPAddress }}' $conteneur
	done
	echo ""
}



# Let's Go !!! ###################################################################""


if [ "$1" == "--create-debian" ];then
	createNodes $2 "debian"

elif [ "$1" == "--create-fedora" ];then
	createNodes $2 "fedora"

elif [ "$1" == "--drop" ];then
	dropNodes "debian"
	dropNodes "fedora"

elif [ "$1" == "--drop-debian" ];then
	dropNodes "debian"

elif [ "$1" == "--drop-fedora" ];then
	dropNodes "fedora"

elif [ "$1" == "--start-debian" ];then
	startNodes "debian"

elif [ "$1" == "--start-fedora" ];then
	startNodes "fedora"

elif [ "$1" == "--ansible" ];then
	createAnsible

elif [ "$1" == "--infos" ];then
	infosNodes

# si aucune option affichage de l'aide
else
	help

fi


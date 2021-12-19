#!/bin/bash

# Nom : Script generaux pour docker
# Auteur : Gaëtan Ritel


if [ "$1" == "" ] || [ "$1" == "--help" ];then
	echo "
	Options :
		--containers_ips : Donne les ips de tous les containers
		--networks_ips : Listes les ips des reseaux
		--containers_info : Infos sur les containers
		--containers_drop : Surpime tous les containers
		--clean_all : Surpime tous les containers, les reseaux, les volumes
		--clean_null_images : Suprime les images null
		--clean_images : Surpime tous les containers, les reseaux, les volumes
		--info : Affiche cette aide
		--php8 : Lance un container avec php8 et composer
		--php7 : Lance un container avec php7.4 et composer
		--rm-php : Suprime le container php

		--create : lancer des conteneurs
		--drop : supprimer les conteneurs créer par le --create
		--infos : caractéristiques des conteneurs (ip, nom, user...)
		--start : redémarrage des conteneurs
		--ansible : déploiement arborescence ansible
		
		--jekyll: Lance un container jekyll

		--portainer: Lance un container portainer, pour gerer les images, containers, ...etc
	"
fi

createNodes() {
	# définition du nombre de conteneur
	nb_machine=1
	[ "$1" != "" ] && nb_machine=$1
	# setting min/max
	min=1
	max=0

	# récupération de idmax
	idmax=`docker ps -a --format '{{ .Names}}' | awk -F "-" -v user="$USER" '$0 ~ user"-debian" {print $3}' | sort -r |head -1`
	# redéfinition de min et max
	min=$(($idmax + 1))
	max=$(($idmax + $nb_machine))

	# lancement des conteneurs
	for i in $(seq $min $max);do
		docker run -tid --privileged --publish-all=true -v /srv/data:/srv/html -v /sys/fs/cgroup:/sys/fs/cgroup:ro --name $USER-debian-$i -h $USER-debian-$i priximmo/buster-systemd-ssh
		docker exec -ti $USER-debian-$i /bin/sh -c "useradd -m -p sa3tHJ3/KuYvI $USER"
		docker exec -ti $USER-debian-$i /bin/sh -c "mkdir  ${HOME}/.ssh && chmod 700 ${HOME}/.ssh && chown $USER:$USER $HOME/.ssh"
	docker cp $HOME/.ssh/id_rsa.pub $USER-debian-$i:$HOME/.ssh/authorized_keys
	docker exec -ti $USER-debian-$i /bin/sh -c "chmod 600 ${HOME}/.ssh/authorized_keys && chown $USER:$USER $HOME/.ssh/authorized_keys"
		docker exec -ti $USER-debian-$i /bin/sh -c "echo '$USER   ALL=(ALL) NOPASSWD: ALL'>>/etc/sudoers"
		docker exec -ti $USER-debian-$i /bin/sh -c "service ssh start"
		echo "Conteneur $USER-debian-$i créé"
	done
	infosNodes	

}

dropNodes(){
	echo "Suppression des conteneurs..."
	docker rm -f $(docker ps -a | grep $USER-debian | awk '{print $1}')
	echo "Fin de la suppression"
}

startNodes(){
	echo ""
	docker start $(docker ps -a | grep $USER-debian | awk '{print $1}')
  for conteneur in $(docker ps -a | grep $USER-debian | awk '{print $1}');do
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
	echo "Informations des conteneurs : "
	echo ""
	for conteneur in $(docker ps -a | grep $USER-debian | awk '{print $1}');do      
		docker inspect -f '   => {{.Name}} - {{.NetworkSettings.IPAddress }}' $conteneur
	done
	echo ""
}
createJekyll() {
	export JEKYLL_VERSION=latest
	docker run --rm \
	--volume="$PWD:/srv/jekyll" \
	-it jekyll/builder:$JEKYLL_VERSION \
	jekyll build --trace
	
}
cleanNullImages() {
	if [ "$(docker images -f "dangling=true" -q | awk '{print $3}' | sort -u)x" != "x" ]
	then
		docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
	fi
}

#si option --create
if [ "$1" == "--create" ];then
	createNodes $2

# si option --drop
elif [ "$1" == "--drop" ];then
	dropNodes

# si option --start
elif [ "$1" == "--start" ];then
	startNodes

# si option --ansible
elif [ "$1" == "--ansible" ];then
	createAnsible

# si option --infos
elif [ "$1" == "--infos" ];then
	infosNodes
elif [ "$1" == "--jekyll" ];then
	createJekyll
fi

if [ "$1" == "--networks_ips" ];then
	if [ `docker network ls -q | wc -l` == 0 ];then
		echo 'Aucun Reseaux Docker'
	else
		docker inspect $(docker network ls -q) | jq ".[]|({
			Name,
			Containers: (.Containers|.[]|{Name,IPv4Address})
		})"
	fi
fi

if [ "$1" == "--containers_ips" ];then
	if [ `docker ps -aq | wc -l` == 0 ];then
		echo 'Aucun Conteneur de demarré'
	else
		docker inspect $(docker ps -aq) | jq ".[]|({
			Name,
			Networks:(.NetworkSettings.Networks|.[]|.IPAddress),
			Ports:(.NetworkSettings.Ports|keys)
		})"
	fi
fi

if [ "$1" == "--containers_info" ];then
	if [ `docker ps -aq | wc -l` == 0 ];then
		echo 'Aucun Conteneur'
	else
		docker inspect $(docker ps -aq) | jq ".[]|({
			Name,
			State:.State.Status,
			User:.Config.User,
			Mounts:.HostConfig.Binds,
			NetworksNames:.HostConfig.NetworkMode,
			Networks:(.NetworkSettings.Networks|.[]|.IPAddress),
			Ports:(.NetworkSettings.Ports|keys)
		})"
	fi
fi

if [ "$1" == "--containers_drop" ];then
	if [ `docker ps -aq | wc -l` == 0 ];then
		echo 'Aucun Conteneur'
	else
		docker stop $(docker pas -aq) && docker rm $(docker pas -aq)
	fi
fi

if [ "$1" == "--clean_all" ];then
	if [ `docker ps -aq | wc -l` == 0 ] && [ `docker volume ls -q | wc -l` == 0 ] && [ `docker network ls -q | wc -l` == 0 ];then
		echo 'Aucun Reeaux, Containers, Volumes'
	else
		docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
		docker volume prune -f
		docker network prune -f
	fi
fi

if [ "$1" == "--clean_images" ];then
	docker images -a | grep "gitlab" -v | awk '{print $3}' | xargs docker rmi -f
fi
if [ "$1" == "--clean_null_images" ];then
	cleanNullImages
fi

if [ "$1" == "--php8" ];then
	if [ `docker ps | grep ritelg-php | wc -l` == 0 ]; then
		echo "  => Creation du containeur php"
		docker run -tid --workdir /var/www -v ${PWD}:/var/www --name ${USER}-php ritelg/php:8-fpm-v1.1-xdebug
		echo "  => création de l'utilisateur ${USER}"
		docker exec -ti ${USER}-php /bin/bash -c "useradd -m -p sa3tHJ3/KuYvI ${USER}"
		docker exec -ti ${USER}-php /bin/bash -c "echo '${USER}   ALL=(ALL) NOPASSWD: ALL'>>/etc/sudoers"
	fi
	docker exec --user ${USER} -it ${USER}-php fish
fi


if [ "$1" == "--php7" ];then
	if [ `docker ps | grep ritelg-php | wc -l` == 0 ]; then
		echo "  => Creation du containeur php"
		docker run -tid --workdir /var/www -v ${PWD}:/var/www --name ${USER}-php ritelg/php:7.4-fpm-v1.1-xdebug
		echo "  => création de l'utilisateur ${USER}"
		docker exec -ti ${USER}-php /bin/bash -c "useradd -m -p sa3tHJ3/KuYvI ${USER}"
		docker exec -ti ${USER}-php /bin/bash -c "echo '${USER}   ALL=(ALL) NOPASSWD: ALL'>>/etc/sudoers"
	fi
	docker exec --user ${USER} -it ${USER}-php fish
fi

if [ "$1" == "--rm-php" ] && [ `docker ps | grep ritelg-php | wc -l` == 1 ];then
	echo "  => Supression du containeur php"
	docker stop ${USER}-php
	docker rm ${USER}-php
else
	echo "Aucun containeur php"
fi

if ["$1" == "--portainer"]; then
	echo "Création du container portainer"
	docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
fi

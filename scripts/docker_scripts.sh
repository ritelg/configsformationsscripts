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
		--clean_images : Surpime tous les containers, les reseaux, les volumes
		--info : Affiche cette aide
		--php : Lance un container avec php7.4 et composer
		--rm-php : Suprime le container php
	"
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

if [ "$1" == "--php" ];then
	if [ `docker ps | grep ritelg-php | wc -l` == 0 ]; then
		echo "  => Creation du containeur php"
		docker run -tid --workdir /var/www -v ${PWD}:/var/www --name ${USER}-php ritelg/php:7.4-v1.0-xdebug
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
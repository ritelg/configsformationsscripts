#!/bin/bash

# Nom : Script generaux pour docker
# Auteur : Gaëtan Ritel


if [ "$1" == "" ] || [ "$1" == "--help" ];then
	echo "
	Options :
		--containers_ips : Donne les ips de tous les containers
		--networks_ips : Listes les ips des containers
		--containers_info : Infos sur les containers
		--containers_drop : Surpime tous les containers
		--clean_all : Surpime tous les containers, les reseaux, les volumes
		--info : Affiche cette aide
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
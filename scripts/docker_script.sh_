#!/bin/bash
#===============================================================================
#
#          FILE: docker_script.sh
# 
#         USAGE: bash docker_script.sh
# 
#   DESCRIPTION: 
# 
#   OPTIONS: 
#		--help: Affiche l’aide
#
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Gaëtan Ritel, 
#       CREATED: 04/09/23
#      REVISION:  
#===============================================================================

help() {
  echo "
    USAGE: docker_script.sh

    OPTIONS: 
      --help: Affiche cette aide
      --php: Lance un container php
      --php-build: Création de l’image php 

  "
}
PHP_IMAGE_NAME="ritelg/php:8.2-fpm-user"

php(){
  echo 'Lancement d’un container PHP\n'
  docker run --rm -v ./:/var/www -it $PHP_IMAGE_NAME fish
}

php_build(){
  echo 'Création de l’image par default pour php'

  USER_ID=$(id -u)
  GROUP_ID=$(id -g)

  docker build --rm --build-arg="USER_ID=$USER_ID" --build-arg="GROUP_ID=$GROUP_ID" -t $PHP_IMAGE_NAME ./php
}

case $1 in
  "--php")
    php 
    ;;
  "--php-build")
    php_build
    ;;
  *)
    help
    ;;
esac


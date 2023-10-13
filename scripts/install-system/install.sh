#!/bin/bash

########################################################
#
# Description : Script pour installer le système 
#
# Auteur : Gaëtan Ritel
#
# Date : 29/03/2023
#
########################################################


function installAnsibleAPT() {
  apt-get update 
  apt-get install --no-install-recommends -y software-properties-common
  apt-add-repository ppa:ansible/ansible 
  apt-get update
  apt-get install -y ansible
  apt-get install -y  python3-pip python3-yaml python3-jinja2 python3-httplib2 python3-paramiko python3-pkg-resources
}

function installAnsiblePYTHON() {
  python3 -m pip install --user ansible
  sudo apt-get install -y  python3-pip python3-yaml python3-jinja2 python3-httplib2 python3-paramiko python3-pkg-resources
}

installAnsiblePYTHON

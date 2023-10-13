#!/bin/bash - 
#===============================================================================
#
#          FILE: script_install.sh
# 
#         USAGE: bash script_install.sh 
# 
#   DESCRIPTION: Script d’installation pour debian
# 
#   OPTIONS: 
#		--help: Affiche l’aide
#
#  REQUIREMENTS: ---
#        AUTHOR: Gaëtan Ritel, 
#       CREATED: 31/12/2021 09:58
#      REVISION:  v0.1
#===============================================================================

set -o nounse
NODE_VERSION=18

help () {
  echo "
    Script d’installation du systéme 
    
    Options: 
      --help: Affiche l’aide

  "	
}

update() {
  sudo apt-get update
  sudo apt-get dist-upgrade -y
}

base_install() {
	echo 'Installation des packages de bases'
  sudo apt-get install -y curl vim git fish git-flow tmux pip exuberant-ctags tig htop fd-find silversearcher-ag python3-pynvim ranger ripgrep gnupg rsync make ffmpeg rsync

  echo 'Installation de Nvim et du plugin Vim Plug'
  mkdir -p ~/.config/nvim
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  wget https://gitlab.com/ritelg/configsformationsscripts/-/archive/nvim-win-debian/configsformationsscripts-nvim-win-debian.zip
}
nodejs_install() {
	echo 'Installation de nodejs'
	curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | sudo -E bash -
	sudo apt-get install -y nodejs
  sudo npm install -g pnpm
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
}

docker_install() {
  sudo apt-get update
  sudo apt-get install ca-certificates curl gnupg
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  sudo chmod a+r /etc/apt/keyrings/docker.gpg

  # Add the repository to Apt sources:
  echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  sudo groupadd docker
  sudo usermod -aG docker $USER
  newgrp docker
}

if [ -z $1 ]; then
	help
  exit 0
fi



update
nodejs_install
base_install
docker_install


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

echo 'Mise à jour du systéme '
sudo apt-get update
# sudo apt-get dist-upgrade -y

echo 'Installation des packages de bases'
sudo apt-get install -y curl vim git zsh git-flow tmux pip exuberant-ctags tig htop fd-find silversearcher-ag python3-pynvim ranger ripgrep gnupg rsync make ffmpeg neovim 

echo 'Installation de php et composer'

# echo 'Installation de Nvim et du plugin Vim Plug'
# mkdir -p ~/.config/nvim
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# wget https://gitlab.com/ritelg/configsformationsscripts/-/archive/nvim-win-debian/configsformationsscripts-nvim-win-debian.zip

docker_install() {
  sudo apt update
  sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.ior
  sudo usermod -aG docker $USER
  newgrp docker
}

if [ -z $1 ]; then
	help
  exit 0
fi



update
base_install
# docker_install


#!/bin/bash

########################################################
#
# Description : Installation du systéme Debian
#
# Auteur : Gaëtan Ritel
#
# Date : 08/02/25
#
########################################################

RESET="\033[0m"
GRAS="\033[1m"
BLEU="\033[34m"
ROUGE="\033[31m"
PREFIX_STRING="###################"

AS_USER="runuser -u ritelg --"
CURRENT_USER="ritelg"

# Stop the script if an error occured
set -e 

if [[ "$EUID" -ne 0 ]]
then
	echo -e "\n $GRAS $ROUGE Ce script doit être lancé en Root \n $RESET"
	exit 1
fi

function update_install_base {
	echo -e "\n $GRAS $BLEU $PREFIX_STRING Update du systéme $PREFIX_STRING $RESET \n"
	# apt update
	# apt upgrade -y
	
	echo -e "\n $GRAS $BLEU $PREFIX_STRING Installations des paquets de bases $PREFIX_STRING $RESET \n"
	apt install tig ranger zsh i3 rofi thunar compton tmux vim git curl wget python3-neovim polybar git-flow ripgrep gnupg rsync make ffmpeg htop fd-find silversearcher-ag exuberant-ctags

  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

  curl -Lso /root/.tmux.conf https://raw.githubusercontent.com/ritelg/configsformationsscripts/refs/heads/master/save/tmux/.tmux.conf
  # curl -Lso /root/.config/ranger/rc.conf https://raw.githubusercontent.com/ritelg/configsformationsscripts/refs/heads/master/save/ranger/rc.conf
  curl -Lso /root/.config/Xresources https://raw.githubusercontent.com/ritelg/configsformationsscripts/refs/heads/master/save/Xresources

  $AS_USER curl -Lso /home/$CURRENT_USER/.tmux.conf https://raw.githubusercontent.com/ritelg/configsformationsscripts/refs/heads/master/save/tmux/.tmux.conf 
  # $AS_USER curl -Lso /home/$CURRENT_USER/.config/ranger/rc.conf https://raw.githubusercontent.com/ritelg/configsformationsscripts/refs/heads/master/save/ranger/rc.conf
  $AS_USER curl -Lso /home/$CURRENT_USER/.config/Xresources https://raw.githubusercontent.com/ritelg/configsformationsscripts/refs/heads/master/save/Xresources


	echo -e "\n $GRAS $BLEU $PREFIX_STRING Configuration de ranger pour $CURRENT_USER et root $PREFIX_STRING $RESET \n"

  ranger --copy-config all
  $AS_USER ranger --copy-config all
}

function config_zsh {
	echo -e "\n $GRAS $BLEU $PREFIX_STRING Configuration de ZSH et Oh my zsh pour $CURRENT_USER et root $PREFIX_STRING $RESET \n"
  usermod root -s /usr/bin/zsh
  usermod $CURRENT_USER -s /usr/bin/zsh
  
  if [[ ! -d "/root/.oh-my-zsh" ]]; then
    RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi
  curl -o /root/.zshrc https://raw.githubusercontent.com/ritelg/configsformationsscripts/refs/heads/master/save/.zshrc

  if [[ ! -d "/home/$CURRENT_USER/.oh-my-zsh" ]]; then
    $AS_USER RUNZSH=no  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi
  $AS_USER curl -o /home/$CURRENT_USER/.zshrc https://raw.githubusercontent.com/ritelg/configsformationsscripts/refs/heads/master/save/.zshrc
}

function config_nvim {
	echo -e "\n $PREFIX_STRING Configuration de VIM/NVIM pour ROOT $PREFIX_STRING $RESET \n"
  
  wget https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.appimage -O /usr/local/bin/nvim
  chmod +x /usr/local/bin/nvim

  VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  VIM_PLUG_PATH=".local/share/nvim/site/autoload/plug.vim"

  if [[ ! -f "/root/$VIM_PLUG_PATH" ]]; then
    curl -fLo /root/$VIM_PLUG_PATH --create-dirs $VIM_PLUG_URL
  fi
  if [[ ! -d "/root/.config/nvim" ]]; then
    git clone --depth 1 --branch nvim-win-debian https://github.com/ritelg/configsformationsscripts.git /root/.config/nvim
    nvim +PlugInstall +qall
  fi

	echo -e "\n $PREFIX_STRING Configuration de VIM/NVIM pour current_user $PREFIX_STRING $RESET \n"

  if [[ ! -f "/home/$CURRENT_USER/$VIM_PLUG_PATH" ]]; then
    $AS_USER curl -fLo /home/$CURRENT_USER/$VIM_PLUG_PATH --create-dirs $VIM_PLUG_URL
  fi
  if [[ ! -d "/home/$CURRENT_USER/.config/nvim" ]]; then
    $AS_USER git clone --depth 1 --branch nvim-win-debian https://github.com/ritelg/configsformationsscripts.git /home/$CURRENT_USER/.config/nvim
    $AS_USER nvim +PlugInstall +qall
  fi
}

function install_kvm {
	echo -e "\n $GRAS $BLEU $PREFIX_STRING Installation de KVM $PREFIX_STRING $RESET \n"
	apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager tt
}

function install_nvm {
  echo -e "\n $GRAS $BLEU $PREFIX_STRING Installation de NVM, NodeJs, Pnpm pour Root $PREFIX_STRING $RESET \n"

  if [[ ! -d "/root/.nvm" ]]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    echo -e "\n\n"
  fi  

  export NVM_DIR="$HOME/.nvm"
  [ -s "/root/.nvm/nvm.sh" ] && \. "/root/.nvm/nvm.sh"

  nvm install --lts
  nvm use --lts
  npm i -g pnpm yarn neovim

  echo -e "\n $GRAS $BLEU $PREFIX_STRING Installation de NVM, NodeJs, Pnpm pour ritelg $PREFIX_STRING $RESET \n"

  if [[ ! -d "/home/$CURRENT_USER/.nvm" ]]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | sudo -u $CURRENT_USER bash
    echo -e "\n\n"
  fi
  sudo -u ritelg bash -c 'export NVM_DIR="/home/ritelg/.nvm"; [ -s "/home/ritelg/.nvm/nvm.sh" ] && . "/home/ritelg/.nvm/nvm.sh" && nvm install --lts && nvm use --lts && npm i -g pnpm yarn neovim'
}

function install_docker {
  echo -e "\n $GRAS $BLEU $PREFIX_STRING Installation de docker $PREFIX_STRING $RESET \n"
}

function install_exegol {
  echo -e "\n $GRAS $BLEU $PREFIX_STRING Installation de Exegol $PREFIX_STRING $RESET \n"
}

update_install_base
install_nvm
config_zsh
config_nvim
install_exegol
#install_kvm



#!/bin/bash

########################################################
#
# Description : Installation du systéme Debian avec ansible
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

set -e 

if [[ "$EUID" -ne 0 ]]
then
	echo -e "\n $GRAS $ROUGE Ce script doit être lancé en Root \n $RESET"
	exit 1
fi

echo -e "\n $GRAS $BLEU $PREFIX_STRING Update du systéme $PREFIX_STRING $RESET \n"
# apt update
# apt upgrade -y

echo -e "\n $GRAS $BLEU $PREFIX_STRING Installations des paquets de bases $PREFIX_STRING $RESET \n"
apt install tig ranger zsh i3 rofi thunar compton tmux vim git curl wget python3-neovim polybar git-flow ripgrep gnupg rsync make ffmpeg htop fd-find silversearcher-ag exuberant-ctags libfuse2 maim xclip lshw jq lftp xdotool
apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager
apt-get install -y  python3-pip python3-yaml python3-jinja2 python3-httplib2 python3-paramiko python3-pkg-resources ansible pipx nmap
apt install libapr1 libaprutil1 libasound2 libglib2.0-0 libxcb-xinput0 -y
apt install darktable -y
apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev libgif-dev

#!/usr/bin/zsh
set -e

# Test update

# This script will be executed on the first startup of each new container with the "my-resources" feature enabled.
# Arbitrary code can be added in this file, in order to customize Exegol (dependency installation, configuration file copy, etc).
# It is strongly advised **not** to overwrite the configuration files provided by exegol (e.g. /root/.zshrc, /opt/.exegol_aliases, ...), official updates will not be applied otherwise.

# Exegol also features a set of supported customization a user can make.
# The /opt/supported_setups.md file lists the supported configurations that can be made easily.


# Install VIM PLUG
#
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

npm i -g neovim
python3 -m pip install neovim
apt install python3-neovim ripgrep perl cpanminus -y
cpanm Neovim::Ext

nvim +PlugInstall +qall


# Install castor
curl "https://castor.jolicode.com/install" | bash

# Install composer
# curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

setxkbmap fr

################ SETUP ORACLE ################

sudo apt-get install libaio1 python3-dev alien python3-pip python3-scapy -y
# git clone https://github.com/quentinhardy/odat.git
# cd odat/
# git submodule init
# sudo submodule update
# sudo apt install oracle-instantclient-basic oracle-instantclient-devel oracle-instantclient-sqlplus -y
# pip3 install cx_Oracle
# sudo pip3 install colorlog termcolor pycryptodome passlib python-libnmap
# sudo pip3 install argcomplete && sudo activate-global-python-argcomplete


################ SETUP SQLPLUS  ################



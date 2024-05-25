#!/usr/bin/fish
set -e

# This script will be executed on the first startup of each new container with the "my-resources" feature enabled.
# Arbitrary code can be added in this file, in order to customize Exegol (dependency installation, configuration file copy, etc).
# It is strongly advised **not** to overwrite the configuration files provided by exegol (e.g. /root/.zshrc, /opt/.exegol_aliases, ...), official updates will not be applied otherwise.

# Exegol also features a set of supported customization a user can make.
# The /opt/supported_setups.md file lists the supported configurations that can be made easily.


# Install VIM PLUG
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p /root/.config/ranger/
cp /opt/my-resources/setup/ranger/rc.conf /root/.config/ranger/rc.conf

# Install castor
# curl "https://castor.jolicode.com/install" | bash

# Install composer
# curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

setxkbmap fr

#!/bin/bash

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

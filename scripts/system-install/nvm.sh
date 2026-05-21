#!/bin/bash

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

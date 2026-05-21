#!/bin/bash

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

#!/bin/bash


SOURCE_DIR="$(dirname ${BASH_SOURCE[0]})/../../save"
DEST_DIR="/home/$CURRENT_USER/.config"

if [[ ! -d "$SOURCE_DIR" ]]; then
  log_error "Le dossier $SOURCE_DIR n'existe pas, copie des dotfiles impossible"
  exit 1
fi

DIRECTORIES=("i3" "ghostty" "polybar" "kitty" "ranger" "zellij" "rofi" "betterlockscreen")

log_info "Créations des liens symboliques pour les répertoires"

for i in "${DIRECTORIES[@]}"; do
  src="$SOURCE_DIR/$i"
  dir="$DEST_DIR/$i"
  if [[ -d "$dir" && ! -h "$dir" ]]; then
    log_warning "Le dossier pour $dir existe"
    $AS_USER mv "$dir" "$dir.save"
  fi

  if [[ ! -h "$dir" ]]; then 
    log_info "Création du lien pour $dir"
    $AS_USER ln -s $src $dir
  fi
done

FILES=(".zshrc" ".gitconfig" ".Xresources" ".zsh_aliases")
DEST_DIR="/home/$CURRENT_USER"

log_info "Créations des liens symboliques pour les fichiers"

for i in "${FILES[@]}"; do
  src="$SOURCE_DIR/$i"
  dir="$DEST_DIR/$i"
  if [[ -f "$dir" && ! -h "$dir" ]]; then
    log_warning "Le fichier $dir existe"
    $AS_USER mv "$dir" "$dir.save"
  fi

  if [[ ! -h "$dir" ]]; then 
    log_info "Création du lien pour $dir"
    $AS_USER ln -s $src $dir
  fi
done

# if [[ ! -f "/home/$CURRENT_USER/fzf-git.sh"  ]];then
#   $AS_USER git clone --depth 1 https://github.com/junegunn/fzf-git.sh.git "/home/$CURRENT_USER/fzf-git.sh"
# fi


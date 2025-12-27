#!/bin/bash

ORANGE="\033[0;33m"
ROUGE="\033[0;31m"
VERT="\033[0;32m"
DEFAULT="\033[0m"

USER="ritelg"

install_docker (){
	echo -e "${VERT}Installation de docker${DEFAULT}"
	file="/etc/apt/keyrings/docker.asc"
	echo -e "${VERT}Ajout de la clé pour docker${DEFAULT}"
	if [[ ! -f "$file" ]];then
		sudo install -m 0755 -d /etc/apt/keyrings
		sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o $file
		sudo chmod a+r $file
	else
		echo -e "${ORANGE}Le fichier $file existe déjà${DEFAULT}"
	fi
	# Add the repository to Apt sources:
	docker_sourcelist="/etc/apt/sources.list.d/docker.sources"
	if [[ ! -f "$docker_sourcelist" ]];then
	echo -e "${VERT}Ajout des sources pour docker${DEFAULT}"
sudo tee $docker_sourcelist <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF
	else 
		echo -e "${ORANGE}Le fichier $docker_sourcelist est déjà present${DEFAULT}"
	fi
  sudo apt update
  sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
  sudo groupadd docker
  sudo usermod -aG docker $USER
  # newgrp docker

}



echo -e "${VERT}Mise à jour du systéme !${DEFAULT}"

install_i3(){
	echo -e "${VERT}Installation de I3 !${DEFAULT}"
	sudo apt install i3 rofi compton polybar
}
sudo apt update
sudo apt upgrade 
echo -e "${VERT}Installation du système ! ${DEFAULT}"
sudo apt install -y git zsh i3 rofi compton ranger polybar ca-certificates curl tmux ripgrep python3-pynvim ruby-full maim xdotool xclip network-manager-applet pipx tig



if [[ ! -d "/home/$USER/.tmux/plugins/tpm/" ]]; then
  echo -e "${VERT}Configuration de TMUX / TPM${DEFAULT}"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  curl -o "/home/$USER/.tmux.conf" https://raw.githubusercontent.com/ritelg/configsformationsscripts/refs/heads/master/save/tmux/.tmux.conf
else 
  echo -e "${ORANGE}Le plugin TMP pour TMUX est déjà installé${DEFAULT}"
fi

if [[ ! -d "/home/$USER/.oh-my-zsh" ]]; then
	echo -e "${VERT}Installation de OhMyZsh ! ${DEFAULT}"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  chsh -s /usr/bin/zsh $USER
  sudo chsh -s /usr/bin/zsh root
  
else 

	echo -e "${ORANGE}OhMyZsh est déjà installé ! ${DEFAULT}"
fi

if [[ ! -d "/home/$USER/.config/nvim" ]]; then
	echo -e "${VERT}Installation de Neovim et Vim Plug ! ${DEFAULT}"
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
	chmod +x nvim-linux-x86_64.appimage
	sudo mv nvim-linux-x86_64.appimage /opt/nvim
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	git clone https://github.com/ritelg/configsformationsscripts.git --branch nvim-win-debian --depth 1 "/home/$USER/.config/nvim"
else 

	echo -e "${ORANGE}VimPlug est déjà installé ! ${DEFAULT}"
fi

#echo -e "${VERT}Installation de kitty${DEFAULT}"
#curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

if [[ ! -d /home/ritelg/tools/zen  ]]; then
	echo -e "${VERT}Installation de zen browser${DEFAULT}"
	zenfile="https://github.com/zen-browser/desktop/releases/latest/download/zen.linux-x86_64.tar.xz"
	curl -O -L $zenfile
	tar xJf zen.linux-x86_64.tar.xz
	rm zen.linux-x86_64.tar.xz

	if [[ ! -d "/home/$USER/tools" ]]; then
		mkdir "/home/$USER/tools"

	fi
	mv zen "/home/$USER/tools" 
fi

if [[ ! -f /home/ritelg/tools/zen/icons/zen-browser.png ]]; then 
	curl -o /home/ritelg/tools/zen/icons/zen-browser.png https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/zen-browser.png
fi
zen_appfile="/home/$USER/.local/share/applications/zen-browser.desktop"
if [[ ! -f $zen_appfile ]]; then
	echo -e "${VERT}Ajout du fichier d'application pour ZEN Browser${DEFAULT}"
	sudo tee $zen_appfile <<EOF
[Desktop Entry]
Name=Zen Browser
Comment=Browse the World Wide Web
GenericName=Web Browser
X-GNOME-FullName=Zen Browser
Exec=/home/ritelg/tools/zen/zen
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/home/ritelg/tools/zen/icons/zen-browser.png
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
EOF
		
fi

if [[ ! -d "/home/$USER/.local/share/fonts" ]]; then
  echo -e "${VERT}Installation de JetBrainsMono${DEFAULT}"
  mkdir -p ~/.local/share/fonts
  cd ~/.local/share/fonts
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
  unzip JetBrainsMono.zip
  rm JetBrainsMono.zip
  fc-cache -fv
  cd "/home/$USER"
else 
  echo -e "${ORANGE}JetBrainsMono déjà installé${DEFAULT}"
fi





install_docker
install_i3

echo -e "${VERT}Installation de Exegol ! ${DEFAULT}"
pipx install exegol
echo "alias exegol='sudo -E $(echo ~/.local/bin/exegol)'" >> ~/.zshrc && source ~/.zshrc
pipx install argcomplete
# Enable compinit if not already enabled
echo "autoload -U compinit && compinit" >> ~/.zshrc
# Add Exegol completion
echo 'eval "$(register-python-argcomplete --no-defaults exegol)"' >> ~/.zshrc
pipx ensurepath


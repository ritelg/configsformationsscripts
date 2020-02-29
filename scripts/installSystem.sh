#!/bin/bash

# Nom : Script pour automatiser l'installation
# Auteur : Gaëtan Ritel

# Mise a jour et installations d'outils pour DEBIAN
# Mise a jour et installations d'outils pour FEDORA
# Installation de nodejs pour DEBIAN
# Installation de vagrant pour FEDORA
# Installation de DOCKER pour
# Installation de VIM pour
# Installation de ZSH pour


debianUpgradeSystemClean() {
	echo 'Nettoyage et Mise à jour de Debian'
	sudo apt-get clean
	sudo apt-get autoclean
	sudo apt-get autoremove
	sudo apt-get update
	sudo apt-get upgrade
	sudo apt-get install  -y
}

fedoraUpgradeSystemClean() {
	echo "Nettoyage et Mise à jour de Fedora"
	sudo yum check-update -y && sudo yum update -y
	sudo yum remove  -y
	sudo yum install kernel-devel-`uname -r` -y
}

debianNodejsInstall() {
	echo 'Installation de nodejs'
	curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
	sudo apt-get install -y nodejs
	
	echo 'Installation de Yarn'
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	sudo apt-get update && sudo apt-get install yarn
	yarn add -g eslint yamllint
}

fedoraInstallVagrant() {
	wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
	sudo mv virtualbox.repo /etc/yum.repos.d/virtualbox.repo
	echo 'Installation de virtualbox' 
	sudo yum localinstall ~/Téléchargements/VirtualBox-6.1-6.1.4_136177_fedora29-1.x86_64.rpm -y
	sudo usermod -a -G vboxusers ritelg
	sudo /usr/lib/virtualbox/vboxdrv.sh setup
	echo 'Installation de vagrant' 
	sudo yum localinstall ~/Téléchargements/vagrant_2.2.7_x86_64.rpm -y
}

installDocker() {
	echo "[3]: install docker & docker-composer"
	curl -fsSL https://get.docker.com | sh; >/dev/null
	usermod -aG docker ritelg
	curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose 
}

installVim() {
	echo 'Installation de Pathogen'
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	echo 'Recuperation de .vimrc'
	wget https://gitlab.com/ritelg-configs/config-dev/raw/master/vim/.vimrc ~/.vimrc
	echo 'Installation de nerdtree'
	git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
	echo 'Installation de vim-airline'
	git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/vim-airline
	echo 'Installation de syntastic'
	git clone https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic
	echo 'Installation de emmet-vim'
	git clone https://github.com/mattn/emmet-vim.git ~/.vim/bundle/emmet-vim
	echo 'Installation de Tagbar'
	git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar
	echo 'Installation de ctrlp'
	git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp/
	echo 'Installation de vimproc'
	git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim
	echo 'Installation de vim-node'
	git clone https://github.com/moll/vim-node.git ~/.vim/bundle/node
	echo 'Installation de vim comment'
	git clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter/
}

installZsh() {
	echo 'Installation de oh my zsh'
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	git clone https://github.com/sindresorhus/pure.git ~/pure/
	mkdir -p ~/.oh-my-zsh/custom/
	mv ~/pure/async.zsh ~/.oh-my-zsh/custom/async.zsh
	rm ~/.oh-my-zsh/themes/pure.zsh-theme
	mv ~/pure/pure.zsh ~/.oh-my-zsh/themes/pure.zsh-theme
	echo 'Mise à jour de .zshrc'
	sed -i "s/robbyrussell/pure/g" ~/.zshrc

	echo 'Installation de tmux' 
	git clone https://github.com/samoshkin/tmux-config.git ~/tmux-config/
	sudo chmod +x ~/tmux/install.sh
	~/tmux-config/install.sh
}

installVim
installZsh

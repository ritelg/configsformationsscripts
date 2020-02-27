# Scripts, Configs, Formations, Docker

****************************

1. [Scripts](#scripts)

2. [Configs](#configs)

3. [Formations](#formations)

4. [Docker et Vagrant et Ansible](#docker-et-Vagrant-et-Ansible)

5. [VSCODE](#vscode)
****************************

### Scripts

* Docker : 
    * Infos reseaux
    * Infos containers
    * Nettoyages Reseaux, Volumes, Containers
* Deploiment de containers
* Installation du system

****************************

### Configs

#### Commandes

* Obtenir nom fenetre : xprop | grep WM_CLASS

#### Installations de i3

```
sudo yum install i3 rofi rxvt-unicode thunar compton fontawesome-fonts ranger fontawesome-fonts lxappearance -y
```

* Configurations : 
    * I3 : save/i3/config -> ~/.config/i3/config
    * Rofi : save/.Xresources -> ~/.Xresources
    * Rxvt (Terminal) : save/.Xresources -> ~/.Xresources
    * Thunar : save/
    * compton : save/compton.conf -> ~/.config/compton.conf

****************************

#### Installtion de Polybar

* https://computingforgeeks.com/install-polybar-status-bar-on-fedora/

```
sudo yum install -y \
        @development-tools \
        cmake \ 
        gcc-c++ \
        autoconf \
        automake \
        xcb-util-xrm-devel \
        xcb-proto \
        xcb-util-devel \
        xcb-util-wm-devel \
        xcb-util-cursor-devel \
        xcb-util-image-devel \
        alsa-lib-devel \
        pulseaudio-libs-devel i3-ipc \
        i3-devel jsoncpp-devel \
        libmpdclient-devel \
        libcurl-devel \
        wireless-tools-devel \
        libnl3-devel \
        cairo-devel

git clone --recursive https://github.com/polybar/polybar

cd polybar
sudo ./build.sh

```

* Configuration : polybar/config -> .config/polybar/config

****************************

### Formations

* Linux : LPIC1 et LPIC2
* Python
* Ruby
* Liens Utiles
* SQL
* 

****************************

### Docker et Vagrant et Ansible

* Dockerfile : 
    * Php 7.4 avec xdebug
    * Debian
    * Jenkins
    * Node
* Docker-compose : 
    * Pipeline avec jenkins, registry docker, gitlab, gtilab runner, serveur sur debian 9
    * Serveur de dev avec php, mysql, adminer, maildev et nginx

* Ansible : Recettes ansible pour installation


### VSCODE

* Extensions : 
    * Docker
    * Vagrant support
    * Live serveur

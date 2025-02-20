# Scripts, Configs, Formations, Docker

#### Le code pour NVIM est à présent sur une branche sépare\*\*

---

1. [Scripts](#scripts)

2. [Configs](#configs)

3. [Formations](#formations)

4. [Docker et Vagrant et Ansible](#docker-et-Vagrant-et-Ansible)

5. [VSCODE](#vscode)

6. [FISH](#fish)

7. [NVIM](#neovim)

---

### Fix color and error for exegol, tmux, nvim
* Add following lines for fixing colors in exegol tmux and nvim

``` bash
set-option -sg escape-time 10
set-option -g focus-events on
set-option -g default-terminal 'tmux-256color'
set -as terminal-overrides ",xterm*:Tc"
```

### Firefox config

* copy userChrome.css dans .mozilla/firefox/6m20r5va.default-esr/chrome/userChrome.css

### Screenshots

#### Requirements

- maim
- xclip

#### Set-up

Set this on your i3 config file `~/.i3/config`

```
## Screenshots
bindsym Print exec --no-startup-id maim "/home/$USER/Pictures/$(date)"
bindsym $mod+Print exec --no-startup-id maim --window $(xdotool getactivewindow) "/home/$USER/Pictures/$(date)"
bindsym Shift+Print exec --no-startup-id maim --select "/home/$USER/Pictures/$(date)"

## Clipboard Screenshots
bindsym Ctrl+Print exec --no-startup-id maim | xclip -selection clipboard -t image/png
bindsym Ctrl+$mod+Print exec --no-startup-id maim --window $(xdotool getactivewindow) | xclip -selection clipboard -t image/png
bindsym Ctrl+Shift+Print exec --no-startup-id maim --select | xclip -selection clipboard -t image/png
```

> You may remove the default screenshot shortcuts to prevent error

#### What it does

| Feature                 | Shortcut                     |
| :---------------------- | :--------------------------- |
| Full Screen             | `PrtScrn`                    |
| Selection               | `Shift` + `PrtScrn`          |
| Active Window           | `Super` + `PrtScrn`          |
| Clipboard Full Screen   | `Ctrl` + `PrtScrn`           |
| Clipboard Selection     | `Ctrl` + `Shift` + `PrtScrn` |
| Clipboard Active Window | `Ctrl` + `Super` + `PrtScrn` |

> All the screen shots are saved on `~/Pictures/CURRENT_DATE`

> `super` key is the _windows_ key

### Outils

- fig pour git

### Scripts

- Docker :
  - Infos reseaux
  - Infos containers
  - Nettoyages Reseaux, Volumes, Containers
- Deploiment de containers
- Installation du system

---

### Configs

#### Update NVIDIA

```
/etc/apt/sources.list
deb http://deb.debian.org/debian/ bookworm main non-free contrib non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm main non-free contrib non-free-firmware

systemctl isolate multi-user.target : Passer en mode console
apt update
apt install nvidia-driver
reboot
```

#### Changer sortie audio

```
pactl list sinks short
    59	alsa_output.pci-0000_01_00.1.hdmi-stereo	PipeWire	s32le 2ch 48000Hz	SUSPENDED
    232	alsa_output.pci-0000_00_1f.3.analog-surround-40	PipeWire	s32le 4ch 48000Hz	RUNNING

pactl set-default-sink alsa_output.pci-0000_01_00.1.hdmi-stereo
```

#### Commandes

- Obtenir nom fenetre : xprop | grep WM_CLASS

#### Installations de i3

```
sudo yum install i3 rofi rxvt-unicode thunar compton fontawesome-fonts ranger fontawesome-fonts lxappearance -y
```

- Configurations :
  - I3 : save/i3/config -> ~/.config/i3/config
  - Rofi : save/.Xresources -> ~/.Xresources
  - Rxvt (Terminal) : save/.Xresources -> ~/.Xresources
  - Thunar : save/
  - compton : save/compton.conf -> ~/.config/compton.conf

---

#### Installtion de Polybar

- https://computingforgeeks.com/install-polybar-status-bar-on-fedora/
- https://github.com/polybar/polybar

- Lister moniteurs : polybar --list-monitors

- Ajouter entree dans /usr/share/applications et creer fichier app.desktop (phpstorm.desktop):

```
    [Desktop Entry]
    Name=PHPSTORM
    Comment=Code Editing. Redefined.
    GenericName=Text Editor
    Exec=/home/ritelg/AppsTar/Phpstorm/bin/phpstorm.sh
    Icon=/home/ritelg/AppsTar/Phpstorm/bin/phpstorm.png
    Type=Application
    StartupNotify=false
    StartupWMClass=Code
    Categories=Utility;TextEditor;Development;IDE;
    MimeType=text/plain;inode/directory;
    Actions=new-empty-window;
    Keywords=phpstorm;

    [Desktop Action new-empty-window]
    Name=New Empty Window
    Exec=/home/ritelg/AppsTar/Phpstorm/bin/phpstorm.sh
    Icon=/home/ritelg/AppsTar/Phpstorm/bin/phpstorm.png
```

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

- Configuration : polybar/config -> .config/polybar/config

---

#### Applications

Le dossier des applications est dans /usr/share/applications

### Formations

- Linux : LPIC1 et LPIC2
- Python
- Ruby
- Liens Utiles
- SQL
- ***

### Docker et Vagrant et Ansible

- Installation de docker (fedora 31):
  - https://medium.com/@drpdishant/installing-docker-on-fedora-31-beta-6c7a05901613
- Dockerfile :
  - Php 7.4 avec xdebug
  - Debian
  - Jenkins
  - Node
- Docker-compose :

  - Pipeline avec jenkins, registry docker, gitlab, gtilab runner, serveur sur debian 9
  - Serveur de dev avec php, mysql, adminer, maildev et nginx

- Ansible : Recettes ansible pour installation

### VSCODE

- Extensions :
  - Docker
  - Vagrant support
  - Live serveur

### Config GIT

- git config --global branch.autosetuprebase always

### Config gnome-terminal

- Thémes : https://github.com/Mayccoll/Gogh

### Fish

- Liens
  - https://github.com/oh-my-fish/oh-my-fish
  - https://github.com/PatrickF1/fzf.fish
  - https://github.com/ggreer/the_silver_searcher
  - https://github.com/BurntSushi/ripgrep
  - https://www.chrisatmachine.com/Neovim/08-fzf/
- Installation de fish et de oh my fish
- Installation de fzf et du plugin pour fish
  - omf install https://github.com/PatrickF1/fzf.fish
  - sudo dnf install fd-find the_silver_searcher ripgrep
- Installation du theme chain
  - omf install chain
- Installation des plugins ssh-agent,
  - omf install https://github.com/zimski/ssh_agent
- Installation de tmux et du Plugin Manager pour installer (tmux-resurect, ..), configuration de tmux : ~/.tmux.conf
  - https://github.com/tmux-plugins/tpm

### Ranger

- Installation :
  - sudo dnf install ranger fzf findutils mlocate
- Plugins
  \*git clone https://github.com/maximtrp/ranger-archives.git ~/.config/ranger/plugins/ranger-archives

### VIM

- Dotfiles :
  - https://github.com/Chewie/dotfiles

#### Copier dans le presse papier de windows avec XCLIP

```
:'<,'>w !xclip -sel clip
```

## Configuration de docker pour ansible

- https://dangibbs.uk/blog/running-systemd-docker-containers-archlinux/

Avant de pouvoir executer des conteneurs docker avec systemd il faut ajouter des lignes dans /etc/default/grub et lancer grub2-mkconfig -o /boot/grub2/grub.cfg

```
# /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT=""
GRUB_CMDLINE_LINUX="quiet systemd.unified_cgroup_hierarchy=0"
```

### Neovim

Snippets dans .config/coc/

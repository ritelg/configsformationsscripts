# Pipeline

## Liens utiles
* https://www.jenkins.io/doc/book/installing/linux/


## Docker
* https://docs.docker.com/engine/install/fedora/

## Vagrant
* Restauration snapshot : 
    * vagrant snapshot restore srvdev-pipeline srvdev-pipeline-init
* Sauvegarde snapshot
    * vagrant snapshot save srvdev-pipeline srvdev-pipeline-init --force
## Jenkins 

* Installation (Impossible de faire fonctionner avec docker)

    ```bash
    sudo wget -O /etc/yum.repos.d/jenkins.repo \
        https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
    sudo dnf upgrade
    # Add required dependencies for the jenkins package
    sudo dnf install chkconfig java-devel
    sudo dnf install jenkins

    sudo usermod -a -G docker jenkins

    sudo systemctl daemon-reload
    sudo systemctl start jenkins

    Création clé ssh pour l’utilisateur jenkins
    sudo -u jenkins -s
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa
    ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@192.168.5.3

    Configuration du ~/.ssh/config

    Host 192.168.5.3
        PreferredAuthentications publickey
        User vagrant
        IdentityFile ~/.ssh/id_rsa
        AddKeysToAgent yes
    ```

## Ansible

* https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-rhel-centos-or-fedora
* https://docs.ansible.com/ansible/2.9/modules/modules_by_category.html
```
sudo dnf install ansible


Installation des roles ansistrano avec l’utilisateur jenkins
    ansible-galaxy install ansistrano.deploy ansistrano.rollback

Creer des roles
    ansible-galaxy init php

Install community.general et community.postgresql
    ansible-galaxy collection install community.general
    ansible-galaxy collection install community.postgresql
    ansible-galaxy collection install community.mysql
    ansible-galaxy collection install ansible.posix

Encrypter mot de passe avec vault
    ansible-vault encrypt_string
Encrypter un mot de passe avec un fichier
    ansible-vault encrypt_string "H2DmQbUw37dD636jQ77m8w82jCwbPz83z6dMUFPJ" --vault-password-file ./ansible/.vault-pass

Demander mot de passe lancement du playbook
    ansible-playbook -i ansible/inventory.yml ansible/playbook.yml
Mot de passe avec fichier
```

## Gitlab
```
mkdir -p /srv/data/gitlab/{config,data,logs}
Creation clé SSH et ajout

https://www.sheevaboite.fr/articles/installer-gitlab-5-minutes-docker/

Ajout de 172.20.0.4 gitlab.ritelg.com dans /etc/hosts

Config ssh ~/.ssh/config :
    Host gitlab.ritelg.com
        PreferredAuthentications publickey
        IdentityFile ~/.ssh/id_rsa_gitlab
        AddKeysToAgent yes

make gitlab
```
# Resume Formation LPIC 1

1. [Liens Utiles](#liens-utiles)
2. [Videos A revoir](#videos-a-revoir)
3. [Commandes](#commandes)
5. [Vim](#vim)
6. [Packages](#packages)
8. [Modules](#modules)
9. [Disques](#disques)
10. [Droits](#droits)
11. [Recherche](#recherche)
12. [Processus](#processus)
13. [Taches planifies](#taches-planifies)
14. [Interfaces Réseaux](#interfaces-rseaux)
15. [Base de données](#base-de-donnes)
16. [Personnalisation](#personnalisation)
17. [Systemd](#systemd)
18. [Commandes utiles](commandes-utiles)
	
## Liens Utiles
* https://traduc.org/LPI
* https://getfedora.org/fr/
* https://www.linuxtricks.fr/wiki/wiki.php

## Videos A revoir
* 25 : YUM et Configuration, 54 quota, 63: introduction processus, 59-60-61-62 Bios, processus

## Commandes 
* whereis
* Aide : man, info
* Joindre fichiers : **cat file1 file2 > test** OU **join** (Jointure par id), **paste** (jointure ligne par ligne)
* **expand**, **unexpand**, **sort**, **split**
* Mettre en forme des textes : **fmt**, Numéroter lignes : **nl**
* Afficher premiere lignes : **head**, **head -n 20** (affiche 20 premieres lignes)
* Afficher dernières lignes : **tail**,
    * **tail -n 20** (affiche 20 dernières lignes),
    * **tail -f** affiche dernières lignes en temps reel
* Afficher Fichier page par page : **less** (h pour l'aide)
* Couper fichier : **cut**
* Afficher :  **wc -l file.txt**(nb lignes), **wc -w file.txt**(nb mots), **wc -c file.txt**(nb octets)
* Modifier dans fichier : **sed**
    * ligne par ligne : **sed "s/entree/sortie/"**
    * Modifier fichier d'entrée : **sed -i "s/entree/sortie/" file.txt**

    * Toute occurrence : **sed "s/entree/sortie/g" file.txt**

## Vim 

* Formation VIM :
	* http://david.blanchet.free.fr/vim/doc/fr62017/help.txt.html
    * Vim tutor fr
    * les modes : v(Visuel), i(insertion), echap(normal)
    * commande en mode Visuel : ~(en majuscules)
    * :help aide de vim
    * commandes :
		* repeter commande .
		* Uncomment : ,cu
		* Comment : ,cc
        * R mode remplacement
        * 0 en debut de ligne
        * fold 11,18 fold, zc ferme, zo ouvert
        * Ctrl+c comment
        * ctrl + v : visuel par bloc
        * shift + v visuel par ligne
        * indenter nombre de lignes >> :  2>>
        * autocompletion (modeInsertion) ctrl+x+o, emmet : Ctrl+y+,
        * ci) ou ci] efface jusqua caractere corespondant
        * o : Ouvrir dans nouvel onglet
        * m : ajouter dossier ou fichier, suprimer, copier, deplacer
        * yy(copier),
        * p(coller) en dessous et P au dessus,
        * dd(suprimer),
        * A(ajouter en fin de ligne),
        * u(annuller derniere operation)
        * ctrl+r(retablir),
        * dw(effaccer jusqua fin du mot),
        * diw(effacer mot sous le curseur)
        * d$(effaccer jusqua fin de la ligne),
        * G fin du fichier
        * gg debut du fichier
        * r remplace curseur sous le caractere
        * recherche /text recherche vers l'avant, ?text recherche vers l'arriere
        * % pour les caractere corespondant
        * o insere une ligne sous le curseur et mode insertion
        * O insere une ligne au dessus du curseur et mode insertion
        * :w file : ecrit dans file
        * :r file : lit file et ecrire dans le fichier courant
        * Quantificateur :
            * 2G rammenne a la ligne 2
            * gg, dd, G : surprime
 tous le fichier

## Packages 
* deb pour Debian, rpm pour red hat
* Gestionnaire de paquets : dpkg, rpm
    * rpm (-v : Verbose)
        * Installer Un paquet : **rpm -i paquet.rpm**  (-h barre de progression), (--test : mode test n'installe pas le paquets)
        * mettre a jour un paquet : **rpm -U paquet.rpm** (Toutes versions ulterieures sera suprimées)
        * Verifier un paquet
        * Desinstaller un paquet : **rpm -e** paquet
            * --allmatches suprimes toutes les versions d'un paquet
            * --test
            * -v ou -vv (debug)
        * Obtenir info paquet : **rpm -qi paquet**
            * -p obtenir info paquets d'un fichier
            * -l listes les fichiers du paquets
            * -d listes fichiers de documentation
            * -c listes les fichiers de configurations
        * Obtenir info fichier : rpm -qf file : retourne le paquet corespondant

    * dpkg
        * Installer Un paquet : **dpkg -i paquet.deb**
            * -R recursive dossier a la place
            * -G ne pas installer si une version plus recente du paquet est deja installer
            * -E ne pas installer si la meme version du paquet est deja installer
            * --no-act simple test
        * mettre a jour un paquet :
        * Verifier un paquet :
        * **dpkg --configure paquet** lance le script de post installation
        * **dpkg -l pattern** listes les paquet corespondant au pattern
        * **dpkg -C** cherche paquets partielement installe
        * Desinstaller un paquet :
            * **dpkg -r paquet**
            * **dpkg -P paquet** : suprime fichier de conf
        * Obtenir info paquet :
            * si deja installer **dpkg -p paquet**
            * si pas installer **dpkg -I paquet.deb**
        * Obtenir info fichier :
            * **dpkg -S pattern** : affiche a quel paquet corespond un ou plusieurs fichiers
            * **dpkg -L paquet** : Liste fichiers associé a un paquets

* Gestionnaire de dépendances et téléchargement : apt-get(debian), yum (red hat)
    * yum
        * **yum update** Mise a jour (si premiere installation : **yum update yum**)
        * **yum check-update** Verifie Mise a jour
        * **yum local-update paquet.rpm** Mise a jour a partir d'un fichier locale
        * **yum upgrade** Mise a jour versions ulterieures (centos 5 -> 6 par exemple)
        * **yum info paquet** : Information paquet equivalent a **rpm -qi paquet**
        * **yum list paquet**  Version et disponibilite de mise a jour d'un paquets
        * **yum provides fonctionnalite** ou **yum provide fichier**
        * **yum install paquet**
        * **yum localinstall paquet.rpm**
        * **yum remove paquet**
        * **yum search mot_clee**
        * **yum clean** Nettoyer paquet telecharge
            * options : headers, packages, metadata, dbcache, plugins, expire-cache, rpmdb, all
        * **yum shell** : Shell Mode
    * apt-cache
        * **apt-cache showpkg paquet** information paquet (dependances etc)
        * **apt-cache stats** statistiques
        * **apt-cache unmet** trouver dependances insatisfaites
        * **apt-cache depends paquets** afficher dependance paquet
        * **apt-cache pkgname expression** recherche paquets installée
        * **apt-cache search** recherche dans les depots
    * apt-get
        * **apt-get check** recherche de dependance defectueuse
        * **apt-get source package** recherche paquet source
        * **apt-get install -f** repare dependance insatisfaites
        * **apt-get -d inst
all ou  upgrade ou source** : telechargement sans installation


## Modules

La plupart des drivers sont incorpores comme des modules ainsi que le système de fichiers
certains intégrés au noyau
* Dans /lib/modules
* Commandes
    * **lsmod** listes des modules charges
    * **modinfo module** obtenir info sur un module
    * **modprobe**
        * **modprobe ehci_hcd** charge module avec dependances
        * **modeprobe -r ehci_hcd** decharge module
        * **modprobe --show-depends ehci_hcd** affiche dependance modules

## Disques
 :
* Partitions primaire 1 a 4
    * /dev/sda1...
* et Partitions logique contenu dans une partition étendu (partition primaire) à partir de 5
* fdisk outils de partitionnement en mode disk
* parted
* Formater disque : mkfs.ext4 /dev/sda1 (ext2 n'a pas de journal d'écriture)
* Swap : sudo mkswap /dev/sda1

* Dumpe2fs : Obtenir Information sur un système de fichier **dump2fs /dev/sdb1**
    * -h n'affiche que les information de super bloc
* tune2fs : Modifier Information sur un système de fichier
    * **tune2fs -L disque1 /dev/sdb1** Changer le label en disque 1
* debugfs : rassemblement de dumpe2fs et tune2fs en mode interactif
* fsck : verifier l'intégrité du système de fichier, recherche les erreurs
    * Non monte ou en lecture seule
    * **fsck /dev/sdb1**
    * **fsck -A** Verifier tous les systèmes de fichiers dans **fstab**
    * **fsck -C /dev/sdb1** Scan avec barre de progression
    * **fsck -t ext4 -C /dev/sdb1** : -t precise le format du système de fichier
    * -V verbose
    * -N lance pas le scan
* mount : Monter système de fichier
    * **mount -t ext4 -r /dev/sdb1 /media/disque** : -r lecture seule
    * -L monter en utilisant le label
    * -U monter en utilisant l'uuid
    * -a monte tous les système de fichier contenu dans fstab
* umount : démonter système de fichier
    * **umount /dev/sdb1**
    * -a démonter tous les système de fichiers contenu dans fstab
    * -t
    * -r remonte en read only en cas d'échec
* /etc/fstab : Automatiser mount
* df -h listes les points de montage

### File system hierarchy standard
* /bin : programme pour tous les utilisateur (ls, mkdir)
* /sbin : programme pour root example (fdisk)
* /lib
* /usr/local/bin utilitaire compile par l'utilisateur
* /usr/bin
* /usr contient tous les fichiers non nécessaires au fonctionnement minimal du système (Interfaces graphiques etc)
* /usr/local Installations locales compilées par l'utilisateur
* /boot : fichier de démarrage système
* /etc : fichiers de configuration
* /srv données service héberge par le système
* /opt : Fichier optionnel (jeux etc)
* /home
* /var
* /tmp fichiers temporaires
* /mnt montée système de fichier temporaire
* /media monte media amovible
* /dev système de fichier virtuel
* /proc système de fichier virtuel

## Droits

* chown modifie le propriétaire du fichier
    * chown ritelg:ritelg test.txt : user:group
    * -R recursive
    * **chgrp groupe file** equivalent a **chown :groupe file**
* droits d'accès posix
    * -rw-r--r-- 1 ritelg ritelg 3213 nov.  23 17:20 zsh
    * 1er Caractère : Type code
        * - fichier
        * d repertoire
        * l lien symbolique
        * p pipe
        * s socket
        * b peripherique bloc
        * c peripherique caractere
    * **chmod u=rw,g=r,o=r file** change les droits a 644
    * SUID : Programme lance avec les droits de son propriétaire
        * si minuscule droits d'execution, si majuscule pas de droits d'execution
        * **chmod u+s file**
        * Protections :
            * N'importe quel ayant les droits  sur un fichier seul le proprietaire pourra ecrire dessus
                * Le suid sera enleve
            * Ignorer suid et sgid pour les script shell
    * SGID : programme lance avec les Droits du groupe propriétaire
        * **chmod g+s file**
    * Sticky Bit :
        * **chmod +t dossier**
        * Restreindre la supression d'un fichier dans un dossier si celui ci contient le stickybit
        * Tout en leur permetant de creer des fichiers
    * Suid: 4, guid: 2, stickybit: 1 total:7,
    * 6744 : rwsr-Sr--, 7777 : rwsrwsrwt, 6666: rwSrwSrw-, 4444: r-Sr--r--
* ACL :
    * ajouter ou modifier droits acl : **sudo setfacl -m user:nomUtilisateur:droits fichier|dossier** ou group:nomgroup:droits
        * **sudo setfacl -m user:liveuser:rwx dossier/**
    * supprimer droits acl : sudo setfacl -x user:nomuser fichier
        * **sudo setfacl -x user:liveuser fichier**
    * -R recursive
    * Droits hérites : sudo setfacl -m d:user:liveuser:rwx dossier/
    * Supprimés toutes les acl : sudo setfacl -b dossier/
    * Supprimer permissions par default : sudo setfacl -k dossier/
    * Masque : droits maximal exemple (et logique entre droits et masque)
        * masque : r--, droits : rwx, total : r--
        * masque : rwx, droits : -wx, total : -wx
        * PAS PRIX EN COMPTE PAR LE PROPRIETAIRE !!!!
        * **sudo setfacl -m m::r-x dossier/**
        * Si on change les acl apres le masque : le masque est annulle
        * hierarchi des droits :
            * droits proprio
                * masque
                    * acl user
                        * acl group
                            * acl group::
                                * posix groupe proprio
* UMASK (droits par default a la creation d'un fichier) :
    * Par default :
        * fichier 0666
        * dossier : 0777
    * Le Umask modifie cela par soustraction
    * Afficher
        * **umask -S** : format classique
        * **umask -p** : format octal
    * Modifier Umask : umask 0444

## Recherche
* find :
    * Analyse fichier par fichier, très lent, mais plein d'options
    * **find . -name pattern**
    * **find . -perm permissions** (-g=w au moins droits d'écriture pour proprio ou -020)
    * **find . -user user**
    * **find . -group group**
    * **find . -size size** (-1M moins de 1 mo)
    * -maxdepth : nombre max de sous repertoire
    * -type b|c|d|p|f|l|s
    * executer une action sur les fichiers trouve :
        * **find . -name test -exec commande \;** et {} pour les parametres avant \
        * **find . -name test -exec rm {} \;** et -ok pour confirmation
* locate :
    * se base sur une base de données donc plus rapide mais faut mettre a jour la base de données et moins d'options
    * mettre a our base de données
    * -i ignore la casse
    * -r regexp
    * -n nb fichiers correspondants
    * autres implementation
        * mlocate
        * slocate
* recherche et informations sur une commande
    * **whereis** :
    * **which** : recherche les fichiers execute pour un commande (-a : toutes occurrences)
    * **type** : affiche comment une commande est interprété

## Processus 

* Hiérarchie :
    * init père de tous les processus
    * **pstree** affiche hiérarchie
* **ps** listes les processus système
    * Par default affiche que les processus du terminal actuelle
    * **ps -e** ou **ps -a** affiche tous les processus
    * -H affiche en hiérarchie, f, --forest
    * -f format complet
    * -l :
    * -j :
    * -u oriente utilisateur
    * -v mémoire virtuelle
    * pour un utilisateur
        * RUID utilisateur yant lance ce processus  : ps --User ritelg
        * EUID : nom utilisateur pour lequel les droits sont utilise par exemple avec suid on lance un commande avec les droits du proprietaire
    * par commande -p  commande
    * par pid : --pid pid
    * personalise sortie -o **ps -o pid,ppid,user**
    * -w ne pas tronquer
    * stats :
        * 1er lettre : S sleep, R run, T stop, Z zombie
        * 2eme lettre : N basse priorite, < haute priorite
        * 3eme lettre :  s session leader, l multithread,
        * + arriere plan
    * exemple concrets :
        * ps auxf
        * ps -C commande -o pid affiche pid du processus commande
* **top**
    * commandes internes
        * h aide
        * k killer processus
        * p trier par usage cpu
        * m trier par usage memoire
        * r renice : modifier
* jobs
    * affiche processus session
* commande & lancer une commande en arrière plan


## Taches planifies 
* cron
    * fichier : /etc/crontab
    * lister taches user : crontab -l
    * ajouter taches user : crontab -e
    * preciser user si root : crontab -u ritelg -e
    * /etc/cron.allow : utilisateur autorise a ajouter taches
    * /etc/cron.deny : utilisateur non autorise a ajouter leur tache
* anacron

## Interfaces Réseaux 
* affiches interfaces :
    * **sudo ip link list** : **sudo ip l l**
    * **sudo lshw --class network** peut aussi lister le reste du materiel
* nom :
    * eth : Ethernets
    * wlan : wifi
    * tun : interface virtuelles de tunnelling
    * lo : boucle locale
    * ppp : modem 3g
    * vboxnet interface virtuelles
* Modifier adresse mac :
    * **sudo ip link set dev namedevice adresse adressemac**
    * **sudo ip link set dev enp5s0f2 address 00:90:f5:d5:5b:75**
* Activer/ désactiver interface :
    * **sudo ip link set dev enp5s0f2 up** : activer
    * **sudo ip link set dev enp5s0f2 down** : désactiver
* wifi :
    * **sudo iwlist wlan0 scan**
    * **sudo iwconfig wlan0 essid SSID**
* ip route :
    * **ip route get IP** pour connaitre le chemin vers l'ip
    * **route -n** liste les routes configurées

## Base de données 
* installer mysql : sudo apt-get install mysql-client mysql-server
* installer postgresql : sudo apt-get install postgresql postgresql-client
* Ajouter une table : CREATE TABLE name(id smallint not null auto_increment, title varchar(255) not null, primary key(id))
* Ajouter un enregistrement a table  : INSERT INTO name VALUES('1','titre1')
* Trier sortie : select * from name order by title desc;
* Update : update name set title=title123 where id=1;
	* update name set title='title15566' where id IN (1,2,3,4);
* Delete : delete from name where id in (1,2,3)

## Personnalisation 
* Installer l'extention mozilla : https://extensions.gnome.org/
* Installer extension Dash to Panel
* Installer chrome gnome shell : sudo apt-get install chrome-gnome-shell
* Installer extension Dash to Panel et gnomenu dans   https://extensions.gnome.org/

## Systemd


* journalctl
    * -f : temps reel
    * -u (SERVICE) : journalctl -u sshd
    * -p err : erreurs
    * -p warning
    * --since 14:25
    * --fields affiches les champs et --field CHAMP affiches les entree de ce champ   

* networkctl
    * networkctl status
    * service : systemctl status systemd-networkd.service

* localectl
    * localectl list-keymaps : listes la claviers

* timedatectl

* hostnamectl


## Commandes utiles

### jq : Manipuler du json

#### Filtre
* . : Retourne ce qui est passe : echo $json | jq . retourne $json indente
* . property equivaut a $json[property] 
* jq .[] retourne un iterateur 
#### Operateur
* | jq filtre1 | filtre2 : Combine
* jq filtre1 , filtre2 : echo $json | jq ., retourne $json 2fois
* () permet de grouper : echo '{ "a" : 1 }' | jq '.,( . | .a )' 
* jq 'keys' retourne les clés
#### Constructeur
* echo '{ "a" : 1 }' | jq [.] : echo '{ "a" : 1 }' | jq '[.]'
* {}


##### Options
* -C Collorations syntaxic 

### AWK 



### xmlstarlet : Manipuler du xml


### pup : Manipuler du html


### yq : Manipuler du yaml


#!/bin/bash - 
#===============================================================================
#
#          FILE: script_install.sh
# 
#         USAGE: bash script_install.sh 
# 
#   DESCRIPTION: Script d’installation du systéme 
# 
#   OPTIONS: 
#		--help: Affiche l’aide
#		--fedora: Lance l’installation pour Fedora 
#		--debian: Lance l’installation pour Debian
#
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Gaëtan Ritel, 
#       CREATED: 31/12/2021 09:58
#      REVISION:  v0.1
#===============================================================================

set -o nounse


help () {
echo "
	Script d’installation du systéme 
	
	Options: 
		--help: Affiche l’aide
		--fedora: Lance l’installation pour Fedora 
		--debian: Lance l’installation pour Debian

"	
}	# ----------  FIN DE LA FONCTION  ----------

if [ -z $1 ]; then
	help
elif [ "$1" =  "--help" ]; then
	help
elif [ "$1" =  "--fedora" ]; then
	echo "Installation de Fedora"
elif [ "$1" =  "--debian" ]; then
	echo "Installation de Debian"
fi


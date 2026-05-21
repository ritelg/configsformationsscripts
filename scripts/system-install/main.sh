#!/bin/bash


########################################################
#
# Description : Installation du systéme Debian
#
# Auteur : Gaëtan Ritel
#
# Date : 08/02/25
#
########################################################

# Stop the script if an error occured
set -e 

AS_USER="runuser -u ritelg --"
CURRENT_USER="ritelg"

source "$(dirname "$0")/utils.sh"

if [[ "$EUID" -ne 0 ]]
then
  log_error "Ce script doit être lancé en ROOT"
	exit 1
fi

source "$(dirname "$0")/sync_dotfiles.sh"

echo "On continue"

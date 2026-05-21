#!/bin/bash

RESET="\033[0m"
GRAS="\033[1m"
BLEU="\033[34m"
ROUGE="\033[31m"
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
YELLOW='\033[1;33m'
PREFIX_STRING="##########"

log_info() {
    echo -e "\n $GRAS $BLEU $1 $RESET \n"
}

log_success() {
    echo -e "\n $GRAS $GREEN $1 $RESET \n"
}

log_warning() {
    echo -e "\n $GRAS $ORANGE $1 $RESET \n"
}

log_error() {
	  echo -e "\n $GRAS $ROUGE $1 \n $RESET"
}


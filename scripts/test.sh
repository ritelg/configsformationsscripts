#!/bin/bash - 
#===============================================================================
#
#          FILE: test.sh
# 
#         USAGE: bash test.sh
#
#===============================================================================

echo $#
echo $*
echo $@

valeur=`ls`
echo $valeur

echo ${#*}
echo ${#@}
texte="Ceci est un texte"

echo ${*[0]}
echo ${*[1]}

#!/bin/bash

# Options du menu
options="Eve-NG | Pc Portable"

chosen=$(echo -e "$options" | rofi -dmenu -lines 5 -p "SSH" -i)

case "$chosen" in
    # "🔒 Verrouiller") i3lock -c 000000 ;;
    "Eve-NG | Pc Portable") ghostty -e ssh -t eveng-pcportable "zellij";;
esac


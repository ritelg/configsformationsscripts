#!/bin/bash

# Options du menu
options="Eve-NG | Pc Portable\nEve-NG | Tour"

chosen=$(echo -e "$options" | rofi -dmenu -lines 5 -p "SSH" -i)

case "$chosen" in
    "Eve-NG | Pc Portable") ghostty -e ssh -t eveng-pcportable "zellij";;
    "Eve-NG | Tour") ghostty -e ssh -t eveng-tour "zellij";;
esac


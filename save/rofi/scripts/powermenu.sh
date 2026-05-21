#!/bin/bash

# Options du menu
options="⏾ Suspendre\n🔄 Redémarrer\n⏻ Éteindre\n🚪 Déconnexion"

chosen=$(echo -e "$options" | rofi -dmenu -lines 5 -p "Powermenu" -i)

case "$chosen" in
    # "🔒 Verrouiller") i3lock -c 000000 ;;
    "⏾ Suspendre") systemctl suspend ;;
    # "⏾ Hibernation") systemctl hibernate ;;
    "🔄 Redémarrer") systemctl reboot ;;
    "⏻ Éteindre") systemctl poweroff ;;
    "🚪 Déconnexion") i3-msg exit ;;  # ou swaymsg exit, etc.
esac


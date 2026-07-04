#!/usr/bin/env bash

# Options
shutdown='⏻ Shutdown'
reboot='🔄 Reboot'
lock='🔒 Lock'
suspend='🌙 Suspend'
logout='🚪 Logout'

# Bring up Rofi menu
chosen=$(echo -e "$lock\n$logout\n$suspend\n$reboot\n$shutdown" | rofi -dmenu -i -p "Power Menu:")

case "$chosen" in
    "$shutdown")
        systemctl poweroff ;;
    "$reboot")
        systemctl reboot ;;
    "$lock")
        # Change this to your preferred locker (i3lock, b穩定-lock, etc.)
        i3lock ;;
    "$suspend")
        systemctl suspend ;;
    "$logout")
        i3-msg exit ;;
    *)
        exit 1 ;;
esac

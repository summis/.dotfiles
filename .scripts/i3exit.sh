#!/bin/bash
#
# Session and power management helper script for i3
# similar to one that Manjaro uses.
# https://raw.githubusercontent.com/Airblader/dotfiles-manjaro/master/.i3/i3exit

case "$1" in
    lock)
        $HOME/.scripts/lock.sh
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        systemctl suspend
        ;;
    hibernate)
        systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 [lock|logout|suspend|hibernate|reboot|shutdown]"
        exit 2
esac

exit 0

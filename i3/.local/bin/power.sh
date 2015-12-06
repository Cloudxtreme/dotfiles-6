#!/bin/zsh

#
# Rofi-based power menu
#
# Author: Sebastian Potasiak <sebpot@protonmail.com>
# Date:   2015-12-06
# File:   ~/.local/bin/power.sh
#

res=$(rofi -width 320 -lines 4 -bw 0 -hide-scrollbar -eh 2 -i -p "› " -dmenu < ~/.config/i3/powermenu)

if [ $res = "lock" ]; then
    lock.sh
fi
if [ $res = "logout" ]; then
    i3-msg exit
fi
if [ $res = "reboot" ]; then
    reboot
fi
if [ $res = "shutdown" ]; then
    poweroff
fi

exit 0

# vim:ft=zsh

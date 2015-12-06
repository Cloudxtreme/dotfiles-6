#!/bin/zsh

#
# Touchpad toggle script
#
# Author: Sebastian Potasiak <sebpot@protonmail.com>
# Date:   2015-12-06
# File:   ~/.local/bin/touchpad.sh
#

touchpad_id=$(xinput list \
    | grep -i 'touchpad' \
    | grep -Eo 'id=[0-9]+' \
    | grep -Eo '[0-9]+')

if [ $# -eq 0 ]; then
    touchpad_state=$(xinput list-props $touchpad_id \
        | grep -i 'device enabled' \
        | grep -Eo '\s[0-1]' \
        | grep -Eo '[0-1]')
    
    if [ $touchpad_state -eq 0 ]; then
        action=1
    else
        action=0
    fi
else
    action=$1
fi

if [ $action -eq 1 ]; then
    xinput enable $touchpad_id
else
    xinput disable $touchpad_id
fi

# vim:ft=zsh

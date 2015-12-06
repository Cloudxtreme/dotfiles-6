#!/bin/zsh

#
# i3lock script
#
# Author: Sebastian Potasiak <sebpot@protonmail.com>
# Date:   2015-12-06
# File:   ~/.local/bin/lock.sh
#

icon="$HOME/pictures/lock.png"
tmpscrot="/tmp/lock.png"

scrot "$tmpscrot"
convert "$tmpscrot" -scale 10% -scale 1000% -modulate 100,50,100 "$tmpscrot"
convert "$tmpscrot" "$icon" -gravity center -composite -matte "$tmpscrot"

i3lock -d -u -i "$tmpscrot"

# vim:ft=zsh

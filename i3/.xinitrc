#!/bin/zsh

#
# Xserver init file
#
# Author: Sebastian Potasiak <sebpot@protonmail.com>
# Date:   2015-12-06
# File:   ~/.xinitrc
#

xrdb -load ~/.Xresources
exec i3

# vim:ft=zsh

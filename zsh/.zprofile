#!/bin/zsh

#
# ZSH profile
#
# Author: Sebastian Potasiak <sebpot@protonmail.com>
# Date:   2015-12-06
# File:   ~/.zprofile
#

# Load user's zshrc
[[ -f ~/.zshrc ]] && source ~/.zshrc

# Start X server
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# vim:ft=zsh

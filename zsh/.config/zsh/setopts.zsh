#
# ZSH options
#
# Author: Sebastian Potasiak <sebpot@protonmail.com>
# Date:   2015-12-06
# File:   ~/.config/zsh/setopts.zsh
#

# GENERAL #####################################################################
setopt no_beep
setopt interactive_comments
setopt rm_star_wait

# CHANGING DIRECTORIES ########################################################
setopt auto_cd
setopt pushd_ignore_dups

# EXTENDING AND GLOBBING ######################################################
setopt extended_glob

# CORRECTION ##################################################################
setopt correct
setopt correctall

# SCRIPTS & FUNCTIONS #########################################################
setopt multios

# vim:ft=zsh

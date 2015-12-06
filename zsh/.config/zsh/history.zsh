#
# ZSH history
#
# Author: Sebastian Potasiak <sebpot@protonmail.com>
# Date:   2015-12-06
# File:   ~/.config/zsh/history.zsh
#

# Set options
setopt append_history
setopt extended_history
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt share_history

# History file settings
HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000
HIST_STAMPS="yyyy-mm-dd"

# vim:ft=zsh

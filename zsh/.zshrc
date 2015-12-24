#
# ZSH RC
#
# Author: Sebastian Potasiak <sebpot@protonmail.com>
# Date:   2015-12-06
# File:   ~/.zshrc
#

# Stop if login shell
[[ -o login && "$(tty)" == "tty1" ]] && return

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# ZSH config directory
ZSH_CONFIG="$HOME/.config/zsh"

# Load dircolors
eval $(dircolors "$HOME/.dircolors")

# Load modules
zmodload zsh/mathfunc

# Load config files
source "$ZSH_CONFIG/setopts.zsh"
source "$ZSH_CONFIG/history.zsh"
source "$ZSH_CONFIG/completion.zsh"
source "$ZSH_CONFIG/bindings.zsh"
source "$ZSH_CONFIG/aliases.zsh"
source "$ZSH_CONFIG/prompt.zsh"
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
source "/usr/share/doc/pkgfile/command-not-found.zsh"
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# vim:ft=zsh


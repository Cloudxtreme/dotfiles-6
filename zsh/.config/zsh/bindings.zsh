#
# ZSH bindings
#
# Author: Sebastian Potasiak <sebpot@protonmail.com>
# Date:   2015-12-06
# File:   ~/.config/zsh/bindings.zsh
#

# Vi mode
bindkey -v

# Create array for keys
typeset -A key

# Aliases for common keys
key[Home]=^[[7~
key[End]=^[[8~
key[Insert]=^[[2~
key[Delete]=^[[3~
key[Up]=^[[A
key[Down]=^[[B
key[Left]=^[[D
key[Right]=^[[C
key[PageUp]=^[[5~
key[PageDown]=^[[6~

# Bind commands to common keys
[[ -n "${key[Home]}"   ]] && bindkey "${key[Home]}"   beginning-of-line
[[ -n "${key[End]}"    ]] && bindkey "${key[End]}"    end-of-line
[[ -n "${key[Insert]}" ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n "${key[Delete]}" ]] && bindkey "${key[Delete]}" delete-char
[[ -n "${key[Up]}"     ]] && bindkey "${key[Up]}"     up-line-or-history
[[ -n "${key[Down]}"   ]] && bindkey "${key[Down]}"   down-line-or-history
[[ -n "${key[Left]}"   ]] && bindkey "${key[Left]}"   backward-char
[[ -n "${key[Right]}"  ]] && bindkey "${key[Right]}"  forward-char

# Bind commands to hotkey combinations
bindkey '^B' beginning-of-line
bindkey '^E' end-of-line
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# vim:ft=zsh

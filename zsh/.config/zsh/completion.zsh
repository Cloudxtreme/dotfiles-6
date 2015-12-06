#
# ZSH completion
#
# Author: Sebastian Potasiak <sebpot@protonmail.com>
# Date:   2015-12-06
# File:   ~/.config/zsh/completion.zsh
#

# Load completion
autoload -U compinit
compinit
zmodload -i zsh/complist

# Set options
setopt completealiases
setopt always_to_end
setopt auto_menu
setopt auto_name_dirs
setopt complete_in_word

unsetopt menu_complete

# Enable completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.cache/zsh/$HOST

# Completers
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# Menu-like completion selection
zstyle ':completion:*' menu select=1 _complete _ignored _approximate

# Colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:commands' list-colors '=*=0;37'
zstyle ':completion:*:builtins' list-colors '=*=0;36'
zstyle ':completion:*:functions' list-colors '=*=0;34'
zstyle ':completion:*:aliases' list-colors '=*=0;33'
zstyle ':completion:*:reserved-words' list-colors '=*=0;31'
zstyle ':completion:*:parameters' list-colors '=*=0;35'

# Kill process list coloring
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([a-z0-9\/]#) #([0-9\:]#) (*[0-9A-Za-z\-_])*=0=31=34=32=33'

# Manpages
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

# Match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "%B%d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# Ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:scp:*' tag-order files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show

# vim:ft=zsh

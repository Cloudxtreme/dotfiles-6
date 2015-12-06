#
# ZSH environment
#
# Author: Sebastian Potasiak <sebpot@protonmail.com>
# Date:   2015-12-06
# File:   ~/.zshenv
#

# PATH
export PATH="$HOME/.local/bin:$PATH"

# XDG config home
export XDG_CONFIG_HOME="$HOME/.config"

# Virtualenv directories
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME="$HOME/dev"
source '/usr/bin/virtualenvwrapper.sh'

# Ruby gems
export GEM_HOME="$(ruby -e 'print Gem.user_dir')/bin"
export PATH="$GEM_HOME:$PATH"

# Java home
export JAVA_HOME="/usr/lib/jvm/java-8-jdk"

# Grep color
export GREP_COLOR='1;33'

# Editors
export EDITOR='vi'
export VISUAL='vim'

# vim:ft=zsh

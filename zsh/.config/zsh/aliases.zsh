#
# ZSH aliases
#
# Author: Sebastian Potasiak <sebpot@protonmail.com>
# Date:   2015-12-06
# File:   ~/.config/zsh/aliases.zsh
#

# Vim-like
alias :q="exit"

# File listing
alias ls="ls -B --group-directories-first --color=auto"
alias ll="ls -l"
alias la="ls -A"
alias lla="la -l"
alias lg="ls -a | grep -i"

# Grep
alias grep="grep --color=auto"

# Python
alias py="python"
alias py.unittest="python -m unittest"
alias py.profile="python -m cProfile"

# Virtualenv
alias venv="workon"
alias venv.exit="deactivate"

alias venv.new="mkvirtualenv"
alias venv.tmp="mktmpenv"
alias venv.ls="lsvirtualenv"
alias venv.show="showvirtualenv"
alias venv.rm="rmvirtualenv"
alias venv.cp="cpviertualenv"
alias venv.all="allvirtualenv"
alias venv.cd="cdvirtualenv"

alias venv.ls.sp="lssitepackages"
alias venv.cd.sp="cdsitepackages"

alias venv.add="add2virtualenv"
alias venv.tgsp="toggleglobalsitepackages"

alias venv.proj.new="mkproject"
alias venv.proj.set="setvirtualenvproject"
alias venv.proj.cd="cdproject"

alias venv.wipe="wipeenv"

# Tmux
alias tmux.new="tmux new -s"
alias tmux.attach="tmux attach -t"
alias tmux.ls="tmux ls"
alias tmux.kill="tmux kill-session -t"
alias tmux.killall="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"

# vim:ft=zsh

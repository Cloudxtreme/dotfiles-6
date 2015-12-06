#
# ZSH prompt
#
# Author: Sebastian Potasiak <sebpot@protonmail.com>
# Date:   2015-12-06
# File:   ~/.config/zsh/prompt.zsh
#

# GENERAL #####################################################################

# Load prompt
autoload -U promptinit
promptinit

# Set options
setopt prompt_subst

# Disable default virtualenv prompt extension
export VIRTUAL_ENV_DISABLE_PROMPT=1

# COLORS ######################################################################

prefix_color='black'
mode_color='white'
venv_color='cyan'
dir_color='yellow'
timer_color='black'

# VI MODE #####################################################################

# Reduce timeout when switching modes
export KEYTIMEOUT=1

# Switch command mode
function zle-keymap-select {
  local vimode
  if [[ $KEYMAP = "vicmd" ]]; then
    vimode="COMMAND"
  else
    vimode="INSERT"
  fi
  zle reset-prompt
}
zle -N zle-keymap-select

# COMMAND EXECUTION TIME ######################################################

# Represent seconds as floating number
typeset -gF SECONDS

# Converts seconds to human-readable format
timeconv() {
    integer h=$((rint($1 / 3600)))
    integer m=$((rint(($1 % 3600) / 60)))
    float s=$(($1 % 60))

    if [[ $h > 0 ]]; then
        printf " %dh" $h
    fi
    if [[ $m > 0 ]]; then
        printf " %dm" $m
    fi
    if [[ $s > 0.0 && $h == 0 ]]; then
        if [[ $m > 0 ]]; then
            printf " %.0fs" $s
        else
            printf " %.3fs" $s
        fi
    fi
}

# Before command execution
function preexec() {
  timer=${timer:-$SECONDS}
  cmd="$(echo "$1" | cut -d' ' -f1)"
  printf "\e]0;%s\a" "$cmd"
}

# After command execution
function precmd() {
  if [ $timer ]; then
    timer_delta=$(printf "%.3f" "$(($SECONDS - $timer))")
    export RPROMPT=$(prompt_segment $timer_color "$(timeconv $timer_delta)")
    unset timer
  fi
}

# FUNCTIONS ###################################################################

prompt_segment() {
	[[ -n $1 ]] && echo -n "%{%F{$1}%}"
	[[ -n $2 ]] && echo -n "%{%B%}$2%{%b%}"
	[[ -n $1 ]] && echo -n "%{%f%}"
}

prompt_prefix() {
	prompt_segment $prefix_color '→ '
}

prompt_mode() {
	prompt_segment $mode_color "${vimode:-INSERT}"
}

prompt_virtualenv() {
  [[ -n $VIRTUAL_ENV ]] && prompt_segment $venv_color " `basename $VIRTUAL_ENV`"
}

prompt_dir() {
	prompt_segment $dir_color ' %~'
}

prompt_git() {
  local git_status="$(git status 2>/dev/null)"
  if [[ -n "$git_status" ]]; then
    local -a arr
    arr=(${(f)git_status})

    [[ $arr[1] =~ 'Not currently on any branch.' ]] \
    && local branch='no-branch' \
    || local branch="${arr[1][(w)4]}"

    [[ $arr[2] =~ 'ahead' ]]    && local st='↑'
    [[ $arr[2] =~ 'behind' ]]   && local st='↓'
    [[ $arr[2] =~ 'diverged' ]] && local st='↕'

    [[ ! $git_status =~ 'nothing to commit' ]] \
    && local git_color='red' \
    || local git_color='green'

    prompt_segment $git_color " ${branch}"
    prompt_segment white "$st"
  fi
}

prompt_end() {
	local symbol_color='green'
	[[ $UID -eq 0 ]] && symbol_color='magenta'
	[[ $RETVAL -ne 0 ]] && symbol_color='red'
	prompt_segment $symbol_color "\n%(?..%? )→"
}

build_lprompt() {
	RETVAL=$?
    prompt_prefix
    prompt_mode
    prompt_dir
    prompt_virtualenv
    prompt_git
	prompt_end
}

# LEFT PROMPT #################################################################

PROMPT='%{%f%b%k%}$(build_lprompt) '

# vim:ft=zsh

#!/bin/zsh

wd="$(pwd)"
if [ $# -gt 0 ]; then
  wd="$1"
fi

name='dev'
if [ $# -gt 1 ]; then
  name="$2"
fi

tmux new-session -d -c "$wd" -n 'editor' -s "$name" 'vim'
tmux split-window -d -c "$wd" -l 5
tmux new-window -d -c "$wd" -n 'running'
tmux new-window -d -c "$wd" -n 'testing'
tmux attach-session -t "$name"

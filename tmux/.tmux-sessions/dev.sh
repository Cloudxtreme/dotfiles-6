#!/usr/bin/zsh

wd="$(pwd)"
if [ $# -gt 0 ]; then
  wd="$1"
fi

name='dev'
if [ $# -gt 1 ]; then
  name="$2"
fi

tmux has-session -t "$name"
if [ $? -eq 1 ]; then
  tmux new-session -d -c "$wd" -n 'editor' -s "$name" 'nvim'
  tmux split-window -d -c "$wd" -l 5 -t "$name":1
  tmux new-window -d -c "$wd" -n 'running' -t "$name"
  tmux new-window -d -c "$wd" -n 'testing' -t "$name"
fi

tmux attach-session -t "$name"

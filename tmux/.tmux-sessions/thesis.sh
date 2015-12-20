#!/bin/zsh

wd="$HOME/documents/studies/inz"

tmux has-session -t 'thesis'
if [ $? -eq 1 ]; then
  tmux new-session -d -c "$wd" -n 'editor' -s 'thesis' 'nvim'
  tmux split-window -d -c "$wd" -l 5 -t 'thesis':1
  tmux send-keys -t 'thesis':1.2 C-z './build.sh' Enter
  tmux new-window -d -c "$wd" -n 'preview' -t 'thesis'
fi

tmux attach-session -t 'thesis'

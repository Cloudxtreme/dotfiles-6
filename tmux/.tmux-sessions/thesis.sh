#!/bin/zsh

wd="$HOME/documents/studies/inz"

tmux new-session -d -c "$wd" -n 'editor' -s 'thesis' 'vim'
tmux split-window -d -c "$wd" -l 5
tmux new-window -d -c "$wd" -n 'preview'
tmux attach-session -t 'thesis'

#!/bin/zsh

#
# Local HTTP server startup script
#
# Author: Sebastian Potasiak <sebpot@protonmail.com>
# Date:   2015-12-06
# File:   ~/.local/bin/start-server.sh
#

cd "$HOME/server"
python -m http.server &
cd -

# vim:ft=zsh

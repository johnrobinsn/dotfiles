#!/bin/bash
BASEDIR="$(dirname "$BASH_SOURCE")"
echo Install from $BASEDIR
ln -sFi $BASEDIR/tmux/.tmux.conf ~/.tmux.conf

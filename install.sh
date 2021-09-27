#!/bin/bash
ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
echo $ABSOLUTE_PATH
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo Install from $BASEDIR
ln -sFi $BASEDIR/tmux/.tmux.conf ~/.tmux.conf

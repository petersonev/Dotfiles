#!/bin/bash

pushd $(dirname $BASH_SOURCE) > /dev/null
curr=$(pwd)
popd > /dev/null

source "$curr/../utils/functions.sh"

link_file "$curr/tmux.conf.symlink"   "$HOME/.tmux.conf"

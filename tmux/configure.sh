#!/bin/bash

pushd $(dirname $0) > /dev/null
curr=$(pwd)
popd > /dev/null

source "$curr/../utils/functions.sh"

overwrite_all=false backup_all=false skip_all=false
link_file "$curr/tmux.conf.symlink"   "$HOME/.tmux.conf"

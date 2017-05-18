#!/bin/bash

pushd $(dirname $0) > /dev/null
curr=$(pwd)
popd > /dev/null

source "$curr/../utils/functions.sh"

if ! p_exist "i3"; then
    echo "i3 not installed"
    exit 1
fi
#TODO: Check for i3blocks and anything else

overwrite_all=false backup_all=false skip_all=false
link_file "$curr/i3.symlink-config"         "$HOME/.config/i3"
link_file "$curr/i3blocks.symlink-config"   "$HOME/.config/i3blocks"

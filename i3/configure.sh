#!/bin/bash

pushd $(dirname $BASH_SOURCE) > /dev/null
curr=$(pwd)
popd > /dev/null

source "$curr/../utils/functions.sh"

if ! p_exist "i3"; then
    warn "i3 not installed"
    if [[ $BASH_SOURCE != $0 ]]; then
        return 1;
    else
        exit 1;
    fi
fi
#TODO: Check for i3blocks and anything else

link_file "$curr/i3.symlink-config"         "$HOME/.config/i3"
link_file "$curr/i3blocks.symlink-config"   "$HOME/.config/i3blocks"

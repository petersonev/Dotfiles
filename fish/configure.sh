#!/bin/bash

pushd $(dirname $BASH_SOURCE) > /dev/null
curr=$(pwd)
popd > /dev/null

source "$curr/../utils/functions.sh"


if ! p_exist "fish"; then
    warn "fish not installed"
    if [[ $BASH_SOURCE != $0 ]]; then
        return 1;
    else
        exit 1;
    fi
fi

link_file "$curr/fish.symlink-config"   "$HOME/.config/fish"

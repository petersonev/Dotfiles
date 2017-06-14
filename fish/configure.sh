#!/bin/bash

pushd $(dirname $BASH_SOURCE) > /dev/null
curr=$(pwd)
popd > /dev/null

source "$curr/../utils/functions.sh"

link_file "$curr/fish.symlink-config"   "$HOME/.config/fish"

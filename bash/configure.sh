#!/bin/bash

pushd $(dirname $BASH_SOURCE) > /dev/null
curr=$(pwd)
popd > /dev/null

source "$curr/../utils/functions.sh"

link_file "$curr/bashrc.symlink"        "$HOME/.bashrc"
link_file "$curr/bash_profile.symlink"  "$HOME/.bash_profile"

#!/bin/bash

pushd $(dirname $0) > /dev/null
curr=$(pwd)
popd > /dev/null

source "$curr/../utils/functions.sh"

overwrite_all=false backup_all=false skip_all=false
link_file "$curr/bashrc.symlink"        "$HOME/.bashrc"
link_file "$curr/bash_profile.symlink"  "$HOME/.bash_profile"

#!/bin/bash

pushd $(dirname $BASH_SOURCE) > /dev/null
curr=$(pwd)
popd > /dev/null

source "$curr/../utils/functions.sh"


git submodule update --init $curr/vim_runtime
info "vim submodules updated"

link_file "$curr/vimrc.symlink"   "$HOME/.vimrc"

#!/bin/bash

pushd $(dirname $0) > /dev/null
curr=$(pwd)
popd > /dev/null

source "$curr/../utils/functions.sh"

git submodule update --init vim/vim_runtime
info "vim submodules updated"

overwrite_all=false backup_all=false skip_all=false
link_file "$curr/vimrc.symlink"   "$HOME/.vimrc"

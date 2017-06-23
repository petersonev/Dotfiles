#!/bin/bash

pushd $(dirname $BASH_SOURCE) > /dev/null
curr=$(pwd)
popd > /dev/null

source "$curr/../utils/functions.sh"

git submodule update --init $curr/oh-my-zsh/
git submodule update --init $curr/zsh-autosuggestions/
git submodule update --init $curr/zsh-syntax-highlighting/
info "zsh submodules updated"

link_file "$curr/zshrc.symlink"   "$HOME/.zshrc"

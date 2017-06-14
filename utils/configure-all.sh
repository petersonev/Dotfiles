#!/bin/bash

pushd $(dirname $0) > /dev/null
curr=$(pwd)
popd > /dev/null

source "$curr/functions.sh"

info "installing dotfiles"

overwrite_all=false backup_all=false skip_all=false
for cfg in $(find -H "$curr/../" -maxdepth 2 -name 'configure.sh')
do
    source $cfg
done

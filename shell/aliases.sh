#!/bin/bash

pushd $(dirname $BASH_SOURCE) > /dev/null
curr=$(pwd)
popd > /dev/null

source $curr/internals.sh

########################################
#              Aliases                 #
########################################

_add_alias ll 'ls -lhA'
_add_alias la 'ls -a'
_add_alias mv 'mv -i'
_add_alias cp 'cp -ri'
_add_alias ln 'ln -i'
# TODO: alias for rm to trash
_add_alias sudo 'sudo -E'
_add_alias ipx 'curl ifconfig.me'    # Get external IP

# Alias to connect to deepthough
_add_alias deepthought 'ssh -l epeterson35 deepthought-login.cc.gatech.edu'

# Aliases specific for custom functions
# TODO check if functions are loaded
_add_alias noa 'no -a'

# TODO: more git aliases
_add_alias gs 'git status'
_add_alias t 'trash'

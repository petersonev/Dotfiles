#!/bin/bash

source internals.sh

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

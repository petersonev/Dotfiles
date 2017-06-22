#!/bin/bash

pushd $(dirname $BASH_SOURCE) > /dev/null
curr=$(pwd)
popd > /dev/null

source $curr/internals.sh

case $(uname -s) in
"Linux")
    # Used for Linux
    # TODO seperate linux distros (lsb_release -si)
    _add_var QEMU "qemu-system-i386"
    ;;
"Darwin")
    # Used for MacOS
    _add_var PATH "${PATH}:/usr/local/bin"
    ;;
esac

_add_var EDITOR "vim"
_add_var XDG_CONFIG_HOME "$HOME/.config"

_add_var LC_ALL "en_US.UTF-8"
_add_var LANG "en_US.UTF-8"

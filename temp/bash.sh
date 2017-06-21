#!/bin/bash

_SHELL=$(ps -o comm= $PPID)

set_fish() {
    echo "set -xg $1 $2" >&3
}

_set() {
    export $1=$2
    if [ $_SHELL == "-fish" ]; then
        echo "set -xg $1 $2" >&3
    fi
}

print_test() {
    echo "this is a test"
    #echo "set -xg test12 test122122" >&3
    _set test34 test444
    _set test44 test445
    echo $test34
    return 10
}
# This allows functions from the script to be called as parameters when run

#echo $SHELL
#TODO Check if this always works
if [ $(ps -o comm= $PPID) == "-fish" ]; then
    echo "running fish"
    $@
    echo "set _status $?" >&3
    exit 9
    #cd $(pwd)
fi


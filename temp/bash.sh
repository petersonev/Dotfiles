#!/bin/bash
echo $BASH_SOURCE
echo $0

if [[ $BASH_SOURCE != $0 ]]; then
    # Script is being sourced
    _SHELL=$(ps -o comm= $$)
else 
    # Script run as sub shell
    _SHELL=$(ps -o comm= $PPID)
fi
_SHELL=${_SHELL##-}
echo $_SHELL

_set() {
    export $1=$2
    if [ $_SHELL == "fish" ]; then
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

mkd() { mkdir -p "${@}" && cd "${@: -1}"; }

#TODO Check if this always works
if [ $_SHELL == "fish" ]; then
    # This allows functions from the script to be called as parameters when run
    $@
    _status=$?
    echo "cd $(pwd)" >&3
    echo "set _status $_status" >&3
fi

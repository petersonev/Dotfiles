#!/bin/bash

source internals.sh

########################################
#        Universal functions           #
########################################
print_test() {
    echo "this is a test"
    #echo "set -xg test12 test122122" >&3
    _add_var test34 test444
    _add_var test44 test445
    _add_alias test23 "echo testtt"
    echo $test34
    return 10
}

mkd() { 
    mkdir -p "${@}" && cd "${@: -1}"
}

mkdd() {
    local dir
    dir=$(date $DATE_FORMAT);
    mkdir -p "${dir}" && cd "${dir}";
}

home() {
    case "$1" in
    "attach")
        ssh -p 9000 -t -XY petersonev.com 'tmux new -A -s ssh'
        ;;
    "lftp")
        lftp -p 9000 sftp://petersonev.com
        ;;
    *)
        ssh -p 9000 petersonev.com -t "$@"
        ;;
    esac
}


########################################
#        Misc for other shells         #
########################################
if [ $_SHELL == "fish" ]; then
    # This allows functions from the script to be called as parameters when run
    $@
    _status=$?
    echo "cd \"$(pwd)\"" >&3
    echo "set _status $_status" >&3
fi

#!/bin/bash

pushd $(dirname $BASH_SOURCE) > /dev/null
curr=$(pwd)
popd > /dev/null

source $curr/internals.sh

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
    # Connect to server
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

sd() {
    # Get directory sizes and sort by size
    du -ah -d 1 $1 | sort -hr
}

_NOTES="$HOME/.notes.txt"
no() {
    # Create or append to notes file
    # Alias noa for no -a
    if [ "$#" -eq 0 ]; then
        if [ $EDITOR == "vim" ]; then
            vim "+normal G" $_NOTES
        else
            $EDITOR $_NOTES
        fi
    elif [ "$1" == "-a" ]; then
        if [ $EDITOR == "vim" ]; then
            #echo -e "\n$(date $DATE_FORMAT)" >> $_NOTES
            vim "+normal Go$(date $DATE_FORMAT)" +startinsert $_NOTES
        else
            $EDITOR $_NOTES
        fi
    else
        echo -e "\n$(date $DATE_FORMAT)\n${*}" >> $_NOTES
    fi
}

hr() {
    # TODO: fix for non bash
    jot -b '-' -s '' ${COLUMNS:-$(tput cols)}
}

format-c() {
    if $(git symbolic-ref HEAD > /dev/null 2>&1); then
        FILES=$(git ls-files | egrep -w -i '.*\.(h|c|cpp|hpp)')
    else
        FILES=$(find . -iname *.h -o -iname *.c -o -iname *.cpp -o -iname *.hpp)
    fi
    clang-format -style=file -i -fallback-style=none --verbose $FILES
}

########################################
#        Misc for other shells         #
########################################
if [ $_SHELL == "fish" ] || [ $_SHELL == "zsh" ]; then
    # This allows functions from the script to be called as parameters when run
    $@
    _status=$?
    echo "cd \"$(pwd)\"" >&3
    echo "set _status $_status" >&3
fi

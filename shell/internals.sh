#!/bin/bash
#echo $(ps -o comm= $$)
#echo $(ps -o comm= $PPID)

#echo $0
#echo ${BASH_SOURCE[0]}
#echo ${BASH_SOURCE[1]}
#echo "lkjlkjklj"

#TODO Check if this always works
if [[ $0 = "bash" ]]; then
    # Being sourced from bash
    # TODO check if sourced from something else
    _SHELL="bash"
else
    _SHELL="$(ps -o comm= $PPID)"
fi

_SHELL=${_SHELL##-}

if [ $_SHELL == "fish" ] || [ $_SHELL == "zsh" ]; then
    if ! { >&3; } 2> /dev/null; then
        # not correctly run from fish (fd 3 does not exist)
        exit 1
    fi
fi

########################################
#         Internal functions           #
########################################
_add_var() {
    export $1="$2"
    #TODO check stuff?
    if [ $_SHELL == "fish" ]; then
        if [ $1 == "PATH" ]; then
            echo "set -xg $1 ${2//:/ }" >&3
        else
            echo "set -xg $1 \"$2\"" >&3
        fi
	elif [ $_SHELL == "zsh" ]; then
		echo "export $1=$2" >&3
    fi
}

_add_alias() {
   _alias="${1}"
   _cmd="${@:2}"
   #TODO check stuff
   alias ${_alias}="${_cmd}"
   if [ $_SHELL == "fish" ]; then
       echo "alias ${_alias}=\"${_cmd}\"" >&3
   elif [ $_SHELL == "zsh" ]; then
       echo "alias ${_alias}=\"${_cmd}\"" >&3
   fi
}

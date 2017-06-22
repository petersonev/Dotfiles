# This is fish config

pushd (dirname (status -f)) > /dev/null
set curr (pwd)
popd > /dev/null

function _bash_function -a script_name func_name
    eval "function $func_name; bash $script_name $func_name \$argv[1..-1] 3>| while read line; eval \$line; if test -n \"\$_status\"; return \$_status; end; end; end"
end

function _bash_run -a script_name
    # TODO Why does this only work in an eval?
    eval "bash $script_name 3>| while read line; eval \$line; if test -n \"\$_status\"; break; end; end"
end

set _bash_func_script "$curr/../../shell/functions.sh"
set _bash_alias_script "$curr/../../shell/aliases.sh"
set _bash_var_script "$curr/../../shell/variables.sh"

#set _bash_functions (bash -c ". $_bash_func_script; typeset -F" | grep "declare -f" | sed -e "s/^declare -f //" -e '/^_/ d')
set _bash_functions (bash -c ". $_bash_func_script; compgen -A function" | sed -e '/^_/ d')

# Add all functions
for _func in $_bash_functions
    _bash_function $_bash_func_script $_func
end

# Add all aliases
_bash_run $_bash_alias_script

# Add all variables
_bash_run $_bash_var_script


# Fish specific variables
set fish_greeting ""

# Less/man colors
#set -x LESS_TERMCAP_mb (printf "\033[01;31m")  
#set -x LESS_TERMCAP_md (printf "\033[01;31m")  
#set -x LESS_TERMCAP_me (printf "\033[0m")  
#set -x LESS_TERMCAP_se (printf "\033[0m")  
#set -x LESS_TERMCAP_so (printf "\033[01;44;33m")  
#set -x LESS_TERMCAP_ue (printf "\033[0m")  
#set -x LESS_TERMCAP_us (printf "\033[01;32m")

# TODO $dirstack for pushd/popd

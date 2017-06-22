
function _bash_function -a script_name func_name
    eval "function $func_name; bash $script_name $func_name \$argv[1..-1] 3>| while read line; eval \$line; if test -n \"\$_status\"; return \$_status; end; end; end"
end

function _bash_run -a script_name func_name
    bash $script_name $func_name $argv[1..-1] 3>| while read line
        eval $line
        if test -n "$_status"
            return $_status
        end
    end
end

set _bash_func_script "functions.sh"
set _bash_alias_script "aliases.sh"
set _bash_var_script "variables.sh"

#set _bash_functions (bash -c ". $_bash_func_script; typeset -F" | grep "declare -f" | sed -e "s/^declare -f //" -e '/^_/ d')
set _bash_functions (bash -c ". $_bash_func_script; compgen -A function" | sed -e '/^_/ d')
echo $_bash_functions

# Add all functions
for _func in $_bash_functions
    _bash_function $_bash_func_script $_func
end

# Add all aliases
_bash_run $_bash_alias_script

# Add all variables
_bash_run $_bash_var_script

exit 0

# $dirstack for pushd/popd

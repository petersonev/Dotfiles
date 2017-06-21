
function _bash_function -a func_name
    eval "function $func_name; bash bash.sh $func_name \$argv[1..-1] 3>| while read line; eval \$line; if test -n \"\$_status\"; return \$_status; end; end; end"
end

exit 0

# Use add_function for functions
# Use shared file for aliases
# Use ??? for env variables

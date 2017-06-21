function _add_function -a func_name
    eval "function $func_name; echo "$func_name \$argv[1..-1]"; end"
end

exit 0

# Use add_function for functions
# Use shared file for aliases
# Use ??? for env variables

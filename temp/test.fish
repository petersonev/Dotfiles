function _add_function -a func_name
    eval "function $func_name; echo "$func_name \$argv[1..-1]"; end"
end


function _bash_function -a func_name
    eval "function $func_name; bash bash.sh $func_name \$argv[1..-1] 3>| while read line; echo \"fish: \$line\"; eval \$line; if test -n \"\$_status\"; echo \$_status; return \$_status; end; end; end"
    #eval "function $func_name; bash bash.sh $func_name \$argv[1..-1]; end"
    #eval "function $func_name; bash bash.sh $func_name \$argv[1..-1] | cat; end"
end

#function test1
#    echo "test_1"
#end

#test1 | while read line
#    cd ~
#    pwd
#    echo $line
#end

#pwd

exit 0

# Use add_function for functions
# Use shared file for aliases
# Use ??? for env variables

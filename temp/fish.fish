#!/usr/local/bin/fish

set -x DIR (cd (dirname (status -f)); and pwd) 

for i in (bash -c 'source bash.sh; compgen -A function')
    #echo "1: $i"
    alias $i="bash bash.sh $i"
end

test

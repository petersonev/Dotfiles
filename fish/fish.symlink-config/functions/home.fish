function home
    switch (echo $argv)
    case attach
        ssh -p 9000 -t -XY petersonev.com 'tmux new -A -s ssh'
    case lftp
        lftp -p 9000 sftp://petersonev.com
    case '*'
        #echo $argv
        ssh -p 9000 petersonev.com -t "$argv"
    end
end

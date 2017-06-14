# This is fish config

switch (uname -s)
    case "Darwin"
        # Used for macOS
        set PATH $PATH /usr/local/sbin
    case "Linux"
        # TODO: seperate linux distros
        #set PATH /usr/bin/core_perl $PATH
        set -x QEMU "qemu-system-i386"
end

set fish_greeting ""
#set LANG en_US.UTF-8
set --export EDITOR "vim"
set --export XDG_CONFIG_HOME "$HOME/.config"

set -x LC_ALL en_US.UTF-8  
set -x LANG en_US.UTF-8

# Less/man colors
#set -x LESS_TERMCAP_mb (printf "\033[01;31m")  
#set -x LESS_TERMCAP_md (printf "\033[01;31m")  
#set -x LESS_TERMCAP_me (printf "\033[0m")  
#set -x LESS_TERMCAP_se (printf "\033[0m")  
#set -x LESS_TERMCAP_so (printf "\033[01;44;33m")  
#set -x LESS_TERMCAP_ue (printf "\033[0m")  
#set -x LESS_TERMCAP_us (printf "\033[01;32m")

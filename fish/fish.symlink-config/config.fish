# This is fish config

switch (uname -s)
    case "Darwin"
        # Used for macOS
        set PATH $PATH /usr/local/sbin
    case "Linux"
        # TODO: seperate linux distros
        set PATH /usr/bin/core_perl $PATH
        set -x QEMU "qemu-system-i386"
end

set fish_greeting ""
#set LANG en_US.UTF-8
set --export EDITOR "vim"
set --export XDG_CONFIG_HOME "$HOME/.config"

set -x LC_ALL en_US.UTF-8  
set -x LANG en_US.UTF-8
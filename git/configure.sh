#!/bin/bash

pushd $(dirname $BASH_SOURCE) > /dev/null
curr=$(pwd)
popd > /dev/null

source "$curr/../utils/functions.sh"

# Setup git config
if ! [ -f $curr/git.symlink-config/config.local ]; then
    info 'setup gitconfig'

    git_credential='cache'
    gpg_program='gpg'
    if [ "$(uname -s)" == "Darwin" ]; then
        git_credential='osxkeychain'
        gpg_program='gpg1'
    fi

    user ' - What is your github author name?'
    read -e git_authorname
    user ' - What is your github author email?'
    read -e git_authoremail

    sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" -e "s/GPG_PROGRAM/$gpg_program/g" $curr/config.local.example > $curr/git.symlink-config/config.local

    success 'gitconfig'
fi

link_file "$curr/git.symlink-config"   "$HOME/.config/git"

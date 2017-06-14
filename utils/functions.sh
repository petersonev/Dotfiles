#!/bin/bash

#echo "functions.sh: $0"
#pushd "$(dirname "$0")/.."
#DOTFILES_ROOT=$(pwd -P)
#popd

p_exist() {
  command -v "$1" >/dev/null 2>&1
}

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_file () {
  local src=$1 dst=$2
  local dst_i=${dst/$HOME/"~"}
  local src_i=${src/$HOME/"~"}


  overwrite_all="${overwrite_all:-false}"
  backup_all="${backup_all:-false}"
  skip_all="${skip_all:-false}"
  
  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst_i"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst_i to ${dst_i}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $dst_i"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$src" "$dst"
    success "linked $src_i to $dst_i"
  fi
}



#install_dotfiles () {
#  info 'installing dotfiles'

#  local overwrite_all=false backup_all=false skip_all=false

#  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
#  do
#    dst="$HOME/.$(basename "${src%.*}")"
#    link_file "$src" "$dst"
#  done
#  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink-config' -not -path '*.git*')
#  do
#    dst="$HOME/.config/$(basename "${src%.*}")"
#    link_file "$src" "$dst"
#  done
  #for src_file in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.setup' -not -path '*.git*')
  #do
  #  bash "$src_file"
  #done
#}

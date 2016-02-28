#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_DIR="$HOME/.dotfiles"

show_help=off
full_install=off
vim_install=off
tmux_install=off
with_vim_plugins=off

case "$1" in
  all) full_install=on;;
  vim) vim_install=on;;
  tmux) tmux_install=on;;
  *) show_help=on;;
esac
shift

while [ $# -gt 0 ]
do
  case "$1" in
    --with-vim-plugins) with_vim_plugins=on;;
    *) show_help=on;;
  esac
  shift
done

function show_help {
  echo "Andreas Schlapsi's dotfiles installer"
  echo "./install.sh all|vim|tmux [--with-vim-plugins]"
  exit 1
}

function verify_arguments {
  if [ $full_install = "on" ]; then
    vim_install=on
    tmux_install=on
  fi

  if [ $vim_install != "on" ] && [ $with_vim_plugins = "on" ]; then
    echo "--with-vim-plugins can only be used if VIM config will be installed!"
    echo
    show_help=on
  fi

  if [ $show_help = "on" ]; then
    show_help
  fi
}

function argparse_report {
  echo "Install VIM config ........$vim_install"
  echo "  - include VIM plugins ...$with_vim_plugins"
  echo "Install tmux config .......$tmux_install"
  echo
}

function move_directory {
  echo "Moving directory from $DIR to $DOTFILES_DIR"

  if [ -d $DOTFILES_DIR ]; then
    echo "$DOTFILES_DIR already exists."
    exit 2
  fi

  cd "$HOME"
  mv "$DIR" "$DOTFILES_DIR"
  cd "$DOTFILES_DIR"
}

function backup_and_link {
  link="$HOME/$1"
  actual="$DOTFILES_DIR/$2"

  backup_dir="$DOTFILES_DIR/.backup"

  if [ ! -d "$backup_dir" ]; then
    echo "- Creating backup directory $backup_dir"
    mkdir "$backup_dir"
  fi

  if [ -f "$link" ]; then
    echo "- Backing up $link"
    mv "$link" "$backup_dir"
  fi

  echo "- Linking $link to $actual"
  ln -s "$actual" "$link"
}

function install_vim_config {
  echo "Installing vim config"
  backup_and_link .vimrc _vimrc
}

function install_vim_plugins {
  echo "- Installing vim plugins"

  if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    echo "  - Cloning Vundle repository"
    git clone https://github.com/gmarik/Vundle.vim "$HOME/.vim/bundle/Vundle.vim"
  fi
  vim +PluginInstall +qall
}

function install_tmux_config {
  echo "Installing tmux config"
  backup_and_link .tmux.conf _tmux.conf
}

verify_arguments
argparse_report
if [ ! -d $DOTFILES_DIR ]; then
  move_directory
fi
if [ $vim_install = "on" ]; then
  install_vim_config
  if [ $with_vim_plugins = "on" ]; then
    install_vim_plugins
  fi
fi
if [ $tmux_install = "on" ]; then
  install_tmux_config
fi


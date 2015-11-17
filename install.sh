#!/usr/bin/env bash


# VIM_USE_YCM=true

. ./bootstrap

# link files
install_dotfiles .vimrc
install_dotfiles .emacs
install_dotfiles .zshrc
install_dotfiles .tmux.conf

#
. ./scripts/install.sh

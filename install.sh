#!/bin/bash

if [ -z "$DOTFILE_DIR" ]
then
	echo "export DOTFILE_DIR=\"$PWD\"" >> ~/.bashrc
	exec $SHELL
fi

# VIM_USE_YCM=true

. $DOTFILE_DIR/bootstrap

# link files
install_dotfiles .vimrc
cp .vimrc_plugins ~/

#install_dotfiles .emacs
install_dotfiles .zshrc
install_dotfiles .tmux.conf

#
#. ./scripts/install.sh

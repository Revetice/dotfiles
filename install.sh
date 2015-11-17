#!/usr/bin/env bash

. ./bootstrap

install_dotfiles .vimrc
install_dotfiles .emacs
install_dotfiles .zshrc
install_dotfiles .tmux.conf

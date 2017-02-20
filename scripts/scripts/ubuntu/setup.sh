#!/bin/bash

git clone https://github.com/Revetice/dotfiles $HOME/dotfiles

cd $HOME/dotfiles
# stow zsh git vim tmux
source install.sh
cd -

chsh -s $(which zsh)
source ../scripts/vim/vundle.sh

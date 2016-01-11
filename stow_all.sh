#!/bin/bash
#stow -v1 vim
#stow -v1 zsh
#stow -v1 bspwm
#stow -v1 sxhkd
#stow -v1 tmux

find * -maxdepth 0 ! -name "*script*" -type d -print0 | xargs -0 stow -v1

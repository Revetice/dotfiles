#!/bin/bash
# pacman -S --needed systemd-kcm
pacman -S --needed rxvt-unicode
pacman -S --needed zsh zsh-completions
# pacman -S --needed gvim
pacman -S --needed vim
pacman -S --needed htop
pacman -S --needed ack
pacman -S --needed stow

# pacman -S --needed plasma-meta
# systemctl enable sddm.service

pacman -S --needed bspwm sxhkd
pacman -S --needed xorg-xrdb

# font
# https://github.com/bohoomil/fontconfig-ultimate

# yaourt
# [archlinuxfr]
# SigLevel = Never
# Server = http://repo.archlinux.fr/$arch

# [infinality-bundle]
# Server = http://bohoomil.com/repo/$arch

# [infinality-bundle-fonts]
# Server = http://bohoomil.com/repo/fonts

# pacman-key -r 962DDE58
# pacman-key --lsign-key 962DDE58
# pacman -Syyu
# pacman -S infinality-bundle

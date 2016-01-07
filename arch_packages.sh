#!/bin/bash
pacman -S --needed systemd-kcm
pacman -S --needed zsh zsh-completions
pacman -S --needed gvim
pacman -S --needed htop
pacman -S --needed ack

pacman -S --needed plasma-meta
# systemctl enable sddm.service

# font
# https://github.com/bohoomil/fontconfig-ultimate

# [infinality-bundle]
# Server = http://bohoomil.com/repo/$arch

# [infinality-bundle-fonts]
# Server = http://bohoomil.com/repo/fonts

# pacman-key -r 962DDE58
# pacman-key --lsign-key 962DDE58
# pacman -Syyu
# pacman -S infinality-bundle

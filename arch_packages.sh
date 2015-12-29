#!/bin/bash
pacman -S --needed systemd-kcm
pacman -S --needed zsh zsh-completions
pacman -S --needed gvim
pacman -S --needed htop
pacman -S --needed ack

pacman -S --needed plasma-meta
# systemctl enable sddm.service

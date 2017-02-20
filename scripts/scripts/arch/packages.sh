#!/bin/bash

pacman_basic=(
# most basic
rxvt-unicode
zsh zsh-completions
tmux
stow
mlocate
pkgfile
vim
htop
ack
tree
rsync
ibus
ibus-chewing
)


pacman_bspwm=(
bspwm sxhkd
feh
xdotool
xorg-xrdb
)

yaourt_bspwm=(
dmenu2
compton
sutils-git xtitle-git lemonbar-xft-git
)

pacman_apps=(
ranger				# file viewer
libcaca				# ascii preview
w3m					# full picture preview
gpicview			# picture viewer
texlive-core		# latex
zathura				# pdf viewer
zathura-pdf-poppler
weechat				# IRC
)

pacman_programs=(
# java
jre8-openjdk
)

yaourt_apps=(
google-chrome
)

pacman_fonts=(
terminus-font
noto-fonts noto-fonts-cjk noto-fonts-emoji
xorg-xfontsel gtk2fontsel
)

pacman_array=(
"${pacman_basic[@]}"
"${pacman_bspwm[@]}"
"${pacman_programs[@]}"
"${pacman_apps[@]}"
"${pacman_fonts[@]}"
)

yaourt_array=(
"${yaourt_bspwm[@]}"
"${yaourt_apps[@]}"
)

sudo pacman -S --needed "${pacman_array[@]}"
yaourt -S --needed "${yaourt_array[@]}"




# show non-local packages
# sudo pacman -Qqen > pkglist.txt
#sudo pacman -S $(< pkglist.txt)

# font
# https://github.com/bohoomil/fontconfig-ultimate

# [infinality-bundle]
# Server = http://bohoomil.com/repo/$arch

# [infinality-bundle-fonts]
# Server = http://bohoomil.com/repo/fonts

# sudo pacman-key -r 962DDE58
# sudo pacman-key --lsign-key 962DDE58
# sudo pacman -Syyu
# sudo pacman -S infinality-bundle

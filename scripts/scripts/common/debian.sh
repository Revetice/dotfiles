#!/usr/bin/env bash

# Basic
sudo apt-get install curl
sudo apt-get install tmux
sudo apt-get install fonts-wqy-zenhei
sudo apt-get install unity-tweak-tool
sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev
sudo apt-get install git


# for vim You Complete Me
sudo apt-get install cmake

# Utilities
sudo apt-get install qalculate
sudo apt-get install tree
sudo apt-get install htop
sudo apt-get install xclip
sudo apt-get install ack-grep


# postgre
# sudo apt-get postgresql postgresql-contrib
# sudo apt-get postgresql-server-dev-all

# sudo apt-get install meld
# sudo apt-get install guake

# Samba
# sudo apt-get install samba
# sudo apt-get install cifs-utils

# Open SSH
# sudo apt-get install openssh-server

# sudo apt-get install emacs sbcl

. ./install_python.sh
. ./vim/install.sh
. ./zsh/install.sh
. ./powerline/install.sh

sudo gem install tmuxinator

#!/bin/bash
source packages-lists.sh

sudo apt-get install -y "${basic[@]}"
sudo apt-get install -y "${vbox[@]}"
# sudo apt-get install -y "${web[@]}"
# sudo apt-get install -y "${samba[@]}"

if ! checkInstalled "google-chrome-stable"; then
  source chrome.sh
fi

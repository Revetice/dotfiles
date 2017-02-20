#!/bin/bash

brew install zsh zsh-completions
brew install zsh-syntax-highlighting

if ! grep -q '/usr/local/bin/zsh' '/etc/shells'
then
    sudo bash -c "echo '/usr/local/bin/zsh' >> /etc/shells"
fi

if [[ "$SHELL" != '/usr/local/bin/zsh' ]]
then
    chsh -s /usr/local/bin/zsh
fi

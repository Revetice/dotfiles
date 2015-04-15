export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bira"
plugins=(git tmux z)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR='vim'
export SHELL='/bin/zsh'

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

if [ -d /usr/local/heroku ]
then
	export PATH="/usr/local/heroku/bin:$PATH"
fi

if [ -d $HOME/.nvm ]
then
	export NVM_DIR="/home/yilin/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi

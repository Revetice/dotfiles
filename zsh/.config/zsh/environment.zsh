export PATH=/usr/local/bin:$PATH
#export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR='vim'
export VISUAL='vim'
export SHELL='/bin/zsh'
# export TERM='xterm-256color'
#
export XDG_DATA_HOME=$HOME/.local/share # mapping: /usr/share
export XDG_CONFIG_HOME=$HOME/.config # mapping: /etc/xdg
#export XDG_CACHE_HOME=$HOME/.cache
#epxort XDG_RUNTIME_DIR
#
if [ -d /usr/local/heroku ]
then
	export PATH="/usr/local/heroku/bin:$PATH"
fi

if [ -d $HOME/.nvm ]
then
	export NVM_DIR="/home/yilin/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi

if [ -f $HOME/.my-zshrc.zsh ]
then
	source $HOME/.my-zshrc.zsh
fi


if [ -d $HOME/.rvm ]
then
	export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
	[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

for f in $HOME/local-zsh/*
do
	source $f
done

# export zsh=$home/.oh-my-zsh

source $HOME/.config/zsh/environment.zsh
source $HOME/.config/zsh/settings.zsh

source /usr/share/zsh-antigen/antigen.zsh

antigen use oh-my-zsh
antigen theme bira

antigen bundle git
antigen bundle tmux
antigen bundle z

DISABLE_AUTO_TITLE=true
#

# ====================
alias tmux="tmux -2"
alias tmuxinator='TERM=xterm-256color tmuxinator'
alias mux='TERM=xterm-256color mux'
# ====================

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

# auto rehash
zstyle ':completion:*' rehash true

if [ -d $HOME/.rvm ]
then
	export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
	[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

for f in $HOME/local-zsh/*
do
	source $f
done

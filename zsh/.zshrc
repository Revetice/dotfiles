export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bira"
# plugins=(git tmux z)
plugins=(tmux z)

# User configuration

DISABLE_AUTO_TITLE=true

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

source $ZSH/oh-my-zsh.sh
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

# Tmux weather plugin
export TMUX_POWERLINE_SEG_WEATHER_LOCATION="90717580"

export PANEL_FIFO PANEL_HEIGHT PANEL_FONT_FAMILY   
# PANEL_FONT_FAMILY="-*-terminus-medium-r-normal-*-12-*-*-*-c-*-*-1"
PANEL_FONT_FAMILY="xft:Hack:pixelsize=14"
PANEL_FIFO=/tmp/panel-fifo
PANEL_HEIGHT=24

export PATH=$HOME/.config/bspwm/panel_default:$PATH

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

# ====================

# auto rehash
zstyle ':completion:*' rehash true


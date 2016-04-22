# export zsh=$home/.oh-my-zsh

source $HOME/.config/zsh/environment.zsh
source $HOME/.config/zsh/settings.zsh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/functions.zsh

source /usr/share/zsh-antigen/antigen.zsh

source /etc/zsh_command_not_found

antigen use oh-my-zsh
antigen theme bira

antigen bundle git
antigen bundle tmux
antigen bundle z

DISABLE_AUTO_TITLE=true

# auto rehash
zstyle ':completion:*' rehash true


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

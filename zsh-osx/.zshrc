
ZDIR="$HOME/.zsh.d"

# grml zshrc
# https://grml.org/zsh/
source "$ZDIR"/grml.zsh
source "$ZDIR"/grml_prompt.zsh

source "$ZDIR"/env.zsh
source "$ZDIR"/aliases.zsh

export WORKON_HOME=~/.envs
# source /usr/local/bin/virtualenvwrapper.sh

# brew install zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# export PATH=/Users/yilin/anaconda2/bin:$PATH

if type "mvim" > /dev/null; then
    alias v='mvim -v'
fi

alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
export PATH=/Users/yilin/Downloads/vlfeat-0.9.20/bin/maci64/:$PATH

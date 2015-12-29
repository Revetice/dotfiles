# git clone git://git.code.sf.net/p/zsh/code zsh
#sudo apt-get install zsh
if [ -f /etc/arch-release ]; then
	sudo pacman -S zsh zsh-completions
fi
chsh -s $(which zsh)

#. ./OMZ.sh


# Install local
# Put in .profile
# [ -f $HOME/bin/zsh ] && exec $HOME/bin/zsh -l

# If csh put this
# if ( -f ~/bin/zsh ) exec ~/bin/zsh -l

# Ask before use
#[ -f $HOME/bin/zsh ] && {
#        echo "Type Y to run zsh: \c"
#        read line
#        [ "$line" = Y ] && exec $HOME/bin/zsh -l
#}
#
#
#if ( -f ~/bin/zsh ) then
#        echo -n "Type Y to run zsh: "
#        if ( "$<" == Y ) exec ~/bin/zsh -l
#endif

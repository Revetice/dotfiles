
checkInstalled () {
  dpkg-query -W --showformat='${Status}\n' $1 | grep "install ok installed" > /dev/null
}

basic=(
vim-gtk
unity-tweak-tool
stow
tmux
powerline
zsh zsh-common zsh-doc zsh-antigen
silversearcher-ag
htop
tree
python-pip
# python-virtualenv
meld
openssh-server
exuberant-ctags
xsel
)

vbox=(
virtualbox virtualbox-guest-dkms virtualbox-guest-additions-iso
)

samba=(
samba cifs-utils
)

other=(
zathura
vagrant
weechat
texlive-full texlive-latex-extra
imagemagick
dict dictd dict-gcide dict-wn dict-devil dict-moby-thesaurus
# For sound
pavucontrol
smplayer
)

web=(
postgresql python-psycopg2
python-flask python-sqlalchemy
)

programming=(
default-jdk
)

ln -s ~/dotfiles/.vimrc ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim -c "VundleInstall" -c "qa"


git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

install_dotfiles

vim -c "VundleInstall" -c "qa"

# Install YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
set t_Co=256

source ~/.vim/basic.vim
source ~/.vim/.vim_myset.vim
source ~/.vim/.vim_plugins.vim
source ~/.vim/.vim_functions.vim

try
    colorscheme molokai
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry

hi CursorLine               ctermbg=238   cterm=none
hi CursorColumn             ctermbg=238
hi Visual                   ctermbg=239

set linespace=1
set cursorcolumn

autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2 expandtab
"'ts' is how tab characters are displayed;
"'sts' is how many "spaces" to insert when the tab key is pressed ;
"'sw' is how many "spaces" to use per indent level;
"'et' is whether to use spaces or tabs;
"'sta' lets you insert 'sw' "spaces" when pressing tab at the beginning of a line

" for transparency
highlight NonText ctermbg=none
highlight Normal ctermbg=none
highlight Special ctermbg=none


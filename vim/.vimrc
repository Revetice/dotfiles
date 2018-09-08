set nocompatible              " be iMproved, required
set t_Co=256

" source ~/.vim/basic.vim
source ~/.vim/.vim_myset.vim
source ~/.vim/.vim_plugins.vim
source ~/.vim/.vim_functions.vim

colorscheme molokai

hi CursorLine               ctermbg=238   cterm=none
hi CursorColumn             ctermbg=238
hi Visual                   ctermbg=239

autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType java setlocal shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 shiftwidth=4 expandtab
" autocmd FileType python setlocal shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType verilog_systemverilog setlocal shiftwidth=4 tabstop=4 softtabstop=4 shiftwidth=4 expandtab
"'ts' is how tab characters are displayed;
"'sts' is how many "spaces" to insert when the tab key is pressed ;
"'sw' is how many "spaces" to use per indent level;
"'et' is whether to use spaces or tabs;
"'sta' lets you insert 'sw' "spaces" when pressing tab at the beginning of a line

" for transparency
highlight NonText ctermbg=none
highlight Normal ctermbg=none
highlight Special ctermbg=none

au BufNewFile,BufRead *.v,*.vh,*.sv,*.svi	set filetype=verilog_systemverilog

try
	set guifont=Sauce\ Code\ Powerline\ ExtraLight:h18
endtry

set clipboard=unnamed

" Remove multiple blank lines
" :g/^$/,/./-j

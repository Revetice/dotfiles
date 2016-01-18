if has("win32")
	language English_United States
endif

    
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"if has("unix")
"	" set rtp+=~/dotfiles/.vim/bundle/Vundle.vim
"	" set rtp+=~/dotfiles/.vim
"	set rtp+=~/.vim/bundle/Vundle.vim
"elseif has("win32")
"	set rtp+=$VIM/.vim/bundle/Vundle.vim
"endif

set rtp+=~/.vim/bundle/Vundle.vim

source ~/.vim/.vim_plugins.vim
source ~/.vim/.vim_functions.vim
source ~/.vim/basic.vim
source ~/.vim/.vim_myset.vim

" if has("unix")
" 	source ~/dotfiles/.vim/vimrcs/basic.vim
" 	source ~/dotfiles/.vim/vimrcs/.vimrc_myset
" elseif has("win32")
" 	source $VIM/.vim/vimrcs/basic.vim
" 	source $VIM/.vim/vimrcs/.vimrc_myset
" endif


nnoremap <F5> :NERDTreeToggle<CR>
" autocmd FileType verilog syn keyword verilogStatement logic



function! Pytest()

python << EOF

import os
from vim import *

cl = current.line
cb = current.buffer
cw = current.window
ct = current.tabpage
cr = current.range



#cb.append("asdf")
cb.append("asdf", cw.cursor[0]) # put after current line
# cw.cursor = (7, 7)

print os.getcwd()
print "this is generated from python"

EOF

endfunction
	
" syntax enable
" set background=dark
" colorscheme solarized
" colorscheme desert
"
set t_Co=256
"set t_Co=255
" set background=dark

"colorscheme molokai

try
    colorscheme molokai
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry

" colorscheme dracula

hi CursorLine               ctermbg=238   cterm=none
hi CursorColumn             ctermbg=238
hi Visual                   ctermbg=239

set linespace=1
set cursorcolumn

autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2 expandtab
"'ts' is how tab characters are displayed; 'sts' is how many "spaces" to insert when the tab key is pressed ; 'sw' is how many "spaces" to use per indent level; 'et' is whether to use spaces or tabs; 'sta' lets you insert 'sw' "spaces" when pressing tab at the beginning of a line
"
let g:UltiSnipsExpandTrigger="@@"

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']

" for transparency
highlight NonText ctermbg=none
highlight Normal ctermbg=none
highlight Special ctermbg=none



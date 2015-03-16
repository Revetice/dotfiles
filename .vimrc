if has("win32")
	language English_United States
endif

    
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has("unix")
	set rtp+=~/dotfiles/.vim/bundle/Vundle.vim
	set rtp+=~/dotfiles/.vim
elseif has("win32")
	set rtp+=$VIM/.vim/bundle/Vundle.vim
endif

if has("unix")
	call vundle#begin()
elseif has("win32")
	call vundle#begin('$VIM/.vim/bundle')
endif
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'surround.vim'
Plugin 'The-NERD-tree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'Syntastic'
Plugin 'Solarized'
Plugin 'EasyMotion'
Plugin 'Indent-Guides'
Plugin 'ctrlp.vim'
" colortheme
Plugin 'molokai'
" Plugin 'RltvNmbr.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
	" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
	" Plugin 'L9'
" Git plugin not hosted on GitHub
	" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
	" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
	" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
	" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" set runtimepath+=$VIM\.vim_runtime

if has("unix")
	source ~/dotfiles/.vim/vimrcs/basic.vim
	source ~/dotfiles/.vim/vimrcs/.vimrc_myset
elseif has("win32")
	source $VIM/.vim/vimrcs/basic.vim
	source $VIM/.vim/vimrcs/.vimrc_myset
endif

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
	
" let g:solarized_termcolors=256
" let g:solarized_termtrans=0
" let g:solarized_contrast=

" syntax enable
" set background=dark
" colorscheme solarized
" colorscheme desert
"
set t_Co=256
"set t_Co=255
" set background=dark

colorscheme molokai

hi CursorLine               ctermbg=238   cterm=none
hi CursorColumn             ctermbg=238
hi Visual                   ctermbg=239

set linespace=1
set cursorcolumn

if has("win32")
	language English_United States
endif

    
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has("unix")
	" set rtp+=~/dotfiles/.vim/bundle/Vundle.vim
	" set rtp+=~/dotfiles/.vim
	set rtp+=~/.vim/bundle/Vundle.vim
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
Plugin 'VisIncr'
Plugin 'matchit.zip'
Plugin 'The-NERD-Commenter'
Plugin 'verilog_systemverilog_fix'
Plugin 'Tabular'
Plugin 'fugitive.vim'
Plugin 'unite.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'UltiSnips'
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

autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2 expandtab
"'ts' is how tab characters are displayed; 'sts' is how many "spaces" to insert when the tab key is pressed ; 'sw' is how many "spaces" to use per indent level; 'et' is whether to use spaces or tabs; 'sta' lets you insert 'sw' "spaces" when pressing tab at the beginning of a line
"
let g:UltiSnipsExpandTrigger="@@"

command! -nargs=? -range Dec2hex call s:Dec2hex(<line1>, <line2>, '<args>')
function! s:Dec2hex(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    else
      let cmd = 's/\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No decimal number found'
    endtry
  else
    echo printf('%x', a:arg + 0)
  endif
endfunction

command! -nargs=? -range Hex2dec call s:Hex2dec(<line1>, <line2>, '<args>')
function! s:Hex2dec(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V0x\x\+/\=submatch(0)+0/g'
    else
      let cmd = 's/0x\x\+/\=submatch(0)+0/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No hex number starting "0x" found'
    endtry
  else
    echo (a:arg =~? '^0x') ? a:arg + 0 : ('0x'.a:arg) + 0
  endif
endfunction

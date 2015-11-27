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

source ~/.vimrc_plugins

" if has("unix")
" 	source ~/dotfiles/.vim/vimrcs/basic.vim
" 	source ~/dotfiles/.vim/vimrcs/.vimrc_myset
" elseif has("win32")
" 	source $VIM/.vim/vimrcs/basic.vim
" 	source $VIM/.vim/vimrcs/.vimrc_myset
" endif

source ~/dotfiles/.vim/vimrcs/basic.vim
source ~/dotfiles/.vim/vimrcs/.vimrc_myset

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

colorscheme molokai
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

" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1

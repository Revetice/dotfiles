
filetype off                  " required
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
call plug#begin('~/.vim/plugged')
" Plug 'gmarik/Vundle.vim'
" Plug 'surround.vim'
" Plug 'bling/vim-airline'
" Plug 'VisIncr'
" Plug 'matchit.zip'
" Plug 'The-NERD-Commenter'
" Plug 'verilog_systemverilog_fix'
" Plug 'airblade/vim-gitgutter'
Plug 'tomasr/molokai'
" Plugin 'davidhalter/jedi-vim'

" Plug 'mattn/emmet-vim'

" Plugin 'ifdef-highlighting'
" Plug 'c.vim'

" Plugin 'Valloric/YouCompleteMe'
" Plugin 'The-NERD-tree'
" Plugin 'Syntastic'
" Plugin 'Solarized'
" Plugin 'EasyMotion'
" Plugin 'Indent-Guides'
" Plugin 'ctrlp.vim'
" Plugin 'UltiSnips'
" Plugin 'RltvNmbr.vim'
" Plugin 'benmills/vimux'
" Plugin 'Tabular'
" Plugin 'fugitive.vim'
" Plugin 'unite.vim'

" call vundle#end()            " required
call plug#end()            " required
filetype plugin indent on    " required

nnoremap <F5> :NERDTreeToggle<CR>

let g:UltiSnipsExpandTrigger="@@"
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']



" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_python_exec = '/usr/bin/python2'

let g:airline_powerline_fonts = 1
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

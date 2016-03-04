
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'surround.vim'
Plugin 'bling/vim-airline'
Plugin 'VisIncr'
Plugin 'matchit.zip'
Plugin 'The-NERD-Commenter'
Plugin 'verilog_systemverilog_fix'
Plugin 'airblade/vim-gitgutter'
Plugin 'molokai'

" Plugin 'Valloric/YouCompleteMe'
" Plugin 'The-NERD-tree'
Plugin 'Syntastic'
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

call vundle#end()            " required
filetype plugin indent on    " required

nnoremap <F5> :NERDTreeToggle<CR>

let g:UltiSnipsExpandTrigger="@@"
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']



set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python2'

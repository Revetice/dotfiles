" nnoremap <C-h> 5h
" nnoremap <C-j> 5j
" nnoremap <C-k> 5k
" nnoremap <C-l> 5l

" Highlight tabstops
nnoremap <leader>t :call HiTab()<cr>

function! HiTab()
	highlight col4 ctermbg=blue guibg=grey
	highlight col8 ctermbg=blue guibg=black
	highlight col12 ctermbg=blue guibg=grey
	highlight col16 ctermbg=blue guibg=black
	if !exists("s:col4")
		let s:col4 = 0
		let s:col8 = 0
		let s:col12 = 0
		let s:col16 = 0
	endif
	if s:col4
		call clearmatches()
		let s:col4 = 0
		let s:col8 = 0
		let s:col12 = 0
		let s:col16 = 0
	else
		let s:col4=matchadd('col4', '\%<6v.\%>5v', -1)
		let s:col8=matchadd('col8', '\%<10v.\%>9v', -1)
		let s:col12=matchadd('col12', '\%<14v.\%>13v', -1)
		let s:col16=matchadd('col16', '\%<18v.\%>17v', -1)
	endif
	" match col4 /\%<5v.\%>4v/
	" match col8 /\%<9v.\%>8v/
endfunction

"
nnoremap <leader>f :call FoldColumnToggle()<cr>

function! FoldColumnToggle()
	if &foldcolumn
		setlocal foldcolumn=0
	else
		setlocal foldcolumn=4
	endif
endfunction


" Grep
nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
	let register = @@

	if a:type ==# 'v'
		execute "normal! `<v`>y"
	elseif a:type ==# 'char'
		execute "normal! `[v`]y"
	else
		return
	endif

	silent execute "grep! -R " . shellescape(@@) . " ."
	copen

	let  @@ = register
endfunction

" Highlight words
"nmap <leader>* :syn match TempKeyword /\<<C-R>=expand("<cword>")<CR>\>/<CR>
"nmap <leader>c :syn clear TempKeyword<CR>
highlight TempKeyword ctermfg=red guibg=DarkRed
" Find color in :h gui-colors or cterm-colors

" guioptions
set guioptions-=r " remove right-hand scroll-bar
set guioptions-=R " remove right-hand scroll-bar
set guioptions-=l " remove left-hand scroll-bar
set guioptions-=L " remove left-hand scroll-bar
set guioptions-=b " remove bottom scroll-bar



" TAB
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4

" Notes
noremap <leader>a :e ~/Dropbox/Ubuntu/Notes/<cr>

if has("win32")
	"set guifont=Consolas:h15
endif

if has("gui_running")
	try
		"set guifont=Source\ Code\ Pro\ 8
		set guifont=Hack\ 12
	endtry
endif

" Verilog
inoremap <leader>* /* ============================================================================================== */


" Colorscheme
" try
"     colorscheme peaksea
" catch
" endtry

" MISC
"if("gui_running")
    set encoding=utf8 
"endif

" set t_Co=256
set nu
if ( exists('+relativenumber'))
	set relativenumber
endif
set cursorline
" highlight cursorline guibg=darkred ctermbg=black

" select last paste yank
nnoremap gp `[v`]

" go to last file
nnoremap gl <C-^>

" quick tab switch
nnoremap <C-p> gT
nnoremap <C-n> gt

" open new line

" Don't use arrow key
" nnoremap <Up> <nop>
" nnoremap <Down> <nop>
" nnoremap <Right> <nop>
" nnoremap <Left> <nop>

" search & center
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" Map esc to jk 
" inoremap jk <esc>
" inoremap <esc> <nop>

" Open and source $MYVIMRC
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Use Numpad
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Op 0
imap <Esc>On .
imap <Esc>OR *
imap <Esc>OQ /
imap <Esc>Ol +
imap <Esc>OS -


" Font

" Show tab number
if exists("+showtabline")
     function MyTabLine()
         let s = ''
         let t = tabpagenr()
         let i = 1
         while i <= tabpagenr('$')
             let buflist = tabpagebuflist(i)
             let winnr = tabpagewinnr(i)
             let mark = ''
             if getbufvar(buflist[winnr - 1], "&modified")
                 let mark = '+'
             endif
             let s .= '%' . i . 'T'
             let s .= (i == t ? '%1*' : '%2*')
             let s .= ' '
             let s .= i . mark . ')'
             let s .= ' %*'
             let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
             
             
             let file = bufname(buflist[winnr - 1])
             let file = fnamemodify(file, ':p:t')
             if file == ''
                 let file = '[No Name]'
             endif
             let s .= file
             let i = i + 1
         endwhile
         let s .= '%T%#TabLineFill#%='
         let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
         return s
     endfunction
     set stal=2
     set tabline=%!MyTabLine() 
endif


" Color column
if exists('+colorcolumn')
  set colorcolumn=101
  highlight ColorColumn ctermbg=lightgrey guibg=darkslategrey
" else
"   au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>101v.\+', -1)
endif

" Vimscript file setting -------------------- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
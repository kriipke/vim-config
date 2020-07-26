" vim settings preferred - this must be first
if &compatible
set nocompatible
endif

" trick to ensure nocompat is set in the absence of +eval feature
silent! while 0
set nocompatible
silent! endwhile

filetype plugin indent on
syntax on

" PLUGIN SETTINGS
let g:lightline = {
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'gitbranch': 'FugitiveHead'
\ },
\ }
vmap <leader>c :Commentary<cr>
nmap <leader>e :Vex<cr>


" BACKUP & VIMINFO
if $XDG_CACHE_HOME
  set backup
  silent !mkdir -p $XDG_CACHE_HOME/vim
  set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
  set backupdir=$XDG_CACHE_HOME/vim
else
  set backup
  silent !mkdir -p $HOME/.cache/vim
  set viminfo+=n$HOME/.cache/vim/viminfo
  set backupdir=$HOME/.cache/vim
endif
set viminfo='20,\"50

set history=5000
set ruler	   	" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu	" display completion matches in a status line

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set ttimeout		" time out for key codes
set ttimeoutlen=50	" wait up to 50ms after Esc for special key

" Do incremental searching when it's possible to timeout.
" ( Makes search act like search in modern browsers )
set incsearch
if has('reltime')
set incsearch
endif

" DIFF ORIG
if !exists(":DiffOrig")
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif
nmap <leader>diff :DiffOrig<cr>

" FILE DISPLAY OPTIONS
set foldcolumn=2
set number
set relativenumber
set numberwidth=5
" Show @@@ in the last line if it is truncated.
set display=truncate

" STATUS LINE
" Always show the status line
set laststatus=2
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" always keep at least 7 lines above/below the cursor
set scrolloff=7

" LOCALE
let $LANG='en'
set langmenu=en
set encoding=utf8

" source $VIMRUNTIME/delmenu.vim
" source $VIMRUNTIME/menu.vim

set ignorecase
set smartcase

set magic

set showmatch
set mat=2

" no bell sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" sets order of EOL tried when working on a new buffer
set ffs=unix,dos,mac

" TABS
set smarttab
set noexpandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8

" INDENT
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" FILE BROWSER
let g:netrw_banner=0
let g:netrw_preview=1
let g:netrw_alto=1
let g:netrw_winsize=25
let g:netrw_listtyle=3
let g:netrw_bannerw_liststyle=3
let g:netrw_browse_split=1

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
au TabLeave * let g:lasttab = tabpagenr()

colorscheme 0o

let mapleader = ";"

" SAVING
command W w !sudo tee % > /dev/null
nmap <leader>W :W<cr>
nmap <leader>w :w!<cr>

" FZF
nmap <leader>/ :Lines<cr>
nmap <leader>b/ :BLines<cr>
nmap <leader>h/ :History:<cr>
nmap <leader>f/ :Files<cr>

" SPLIT WINDOW
nmap <leader>sj :belowright split<cr>
nmap <leader>sk :split<cr>
nmap <leader>sh :vsplit<cr>
nmap <leader>sl :belowright vsplit<cr>

" NEW WINDOW
nmap <leader>J :belowright new +Files.<cr>
nmap <leader>K :new +Files.<cr>
nmap <leader>H :vnew +Files.<cr>
nmap <leader>L :belowright vnew +Files.<cr>

" CHANGE WINDOW
nmap <leader>k <C-w>k
nmap <leader>j <C-w>j
nmap <leader>h <C-w>h
nmap <leader>l <C-w>l
nmap <leader><space> <C-w>P

" RESIZE WINDOW
nmap <leader><C-j> <C-w>-
nmap <leader><C-k> <C-w>+
nmap <leader><C-h> <C-w><
nmap <leader><C-l> <C-w>>

" MISC WINDOW
" pane exit
nmap <leader>D <C-w>q
" pane fullscreen
nmap <leader>f <C-w>l

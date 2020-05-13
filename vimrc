" vim settings preferred - this must be first
if &compatible
set nocompatible
endif

" trick to ensure nocompat is set in the absence of +eval feature
silent! while 0
set nocompatible
silent! endwhile

filetype off                  " required

set rtp+=/usr/share/vim/vimfiles/bundle/Vundle.vim
call vundle#begin('/usr/share/vim/vimfiles/bundle/')
Plugin 'VundleVim/Vundle.vim'
"Plugin 'rkitover/vimpager'
Plugin 'itchyny/lightline.vim'
Plugin 'maximbaz/lightline-ale'
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'sirver/ultisnips'
Plugin 'chrisbra/csv.vim'
Plugin 'vim-scripts/bats.vim'
if ! $SSH_CLIENT
    Plugin 'Lokaltog/vim-monotone'
    Plugin 'mswift42/vim-themes'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'tmux-plugins/vim-tmux'
    Plugin 'tmux-plugins/vim-tmux-focus-events'
    Plugin 'file:///home/l0xy/src/xandria.vim'
endif
call vundle#end()            " required

filetype plugin indent on    " required
syntax on

let g:lightline = {
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'gitbranch': 'FugitiveHead'
\ },
\ }

if $XDG_CACHE_HOME
  set backup
  silent !mkdir -p $XDG_CACHE_HOME/vim
  set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
  set backupdir=$XDG_CACHE_HOME/vim
endif
set viminfo='20,\"50	

if &term=="linux"
  colorscheme default
else
  colorscheme blaquemagick
  let g:lightline = {
    \ 'colorscheme': 'seoul256'
    \ }
endif

if &term=="xterm"
  set t_Co=8
  set t_Sb=[4%dm
  set t_Sf=[3%dm
elseif &term=="screen"
  set t_Co=16
  set t_Sb=[4%dm
  set t_Sf=[3%dm
endif

set history=5000	
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu	" display completion matches in a status line

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set ttimeout		" time out for key codes
set ttimeoutlen=25	" wait up to 50ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate


" Do incremental searching when it's possible to timeout.
" ( Makes search act like search in modern browsers )
set incsearch
if has('reltime')
set incsearch
endif

" do not recognize octal numbers for Ctrl-A and Ctrl-X
" most users find it confusing
set nrformats-=octal

if has("cscope") && filereadable("/usr/bin/cscope")
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb
" add any database in current directory
if filereadable("cscope.out")
  cs add $PWD/cscope.out
" else add database pointed to by environment
elseif $CSCOPE_DB != ""
  cs add $CSCOPE_DB
endif
set csverb
endif


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
" Prevent that the langmap option applies to characters that result from a
" mapping.  If set (default), this may break plugins (but it's backward
" compatible).
set nolangremap
endif


" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

let g:dokuwiki_fenced_languages = ['css', 'sh', 'html', 'yaml']
let g:user_emmet_leader_key='<C-f>'


" always keep at least 7 lines above/below the cursor
set scrolloff=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
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

set encoding=utf8

" sets order of EOL tried when working on a new buffer
set ffs=unix,dos,mac


" TABS & LINE BREAKS

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_bannerw_liststyle=3
let g:netrw_browse_split=1


" linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
au TabLeave * let g:lasttab = tabpagenr()

" Always show the status line
set laststatus=2

" LINE NUMBERS
set foldcolumn=1
set number
set relativenumber
set numberwidth=5
silent

" ====== CUSTOM KEYBINDINGS ======

let mapleader = ";"

" fzf bindings
nmap <leader>/ :Lines<cr>
nmap <leader>b/ :BLines<cr>
nmap <leader>h/ :History:<cr>
nmap <leader>f/ :Files<cr>

" Fast saving
nmap <leader>w :w!<cr>

" split window
nmap <leader>sj :belowright split<cr>
nmap <leader>sk :split<cr>
nmap <leader>sh :vsplit<cr>
nmap <leader>sl :belowright vsplit<cr>

" new window (split )
nmap <leader>J :belowright new +Files.<cr>
nmap <leader>K :new +Files.<cr>
nmap <leader>H :vnew +Files.<cr>
nmap <leader>L :belowright vnew +Files.<cr>

" navigate windows
nmap <leader>k <C-w>k
nmap <leader>j <C-w>j
nmap <leader>h <C-w>h
nmap <leader>l <C-w>l
nmap <leader><space> <C-w>P

" resize window
nmap <leader><C-j> <C-w>-
nmap <leader><C-k> <C-w>+
nmap <leader><C-h> <C-w><
nmap <leader><C-l> <C-w>>

" pane exit
nmap <leader>D <C-w>q
" pane fullscreen
nmap <leader>F <C-w>l

nmap <leader>c :Commentary<cr>

nmap <leader>e :Vex<cr>

command W w !sudo tee % > /dev/null


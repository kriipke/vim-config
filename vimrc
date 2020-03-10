" vim settings preferred - this must be first
if &compatible
  set nocompatible
endif

" trick to ensure nocompat is set in the absence of +eval feature
silent! while 0
  set nocompatible
silent! endwhile

"set runtimepath=$/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim81,XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME
let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
set directory=$XDG_CACHE_HOME/vim,~/,/tmp

set backup
set backupdir=$XDG_CACHE_HOME/vim,~/,/tmp

set viminfo='20,\"50	
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
elseif &term=="screen"
     set t_Co=256
     set background=dark
     let g:PaperColor_Theme_Options = {
       \   'theme': {
       \     'default': {
       \       'transparent_background': 1
       \     }
       \   }
       \ }
     colorscheme PaperColor
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

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

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

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  let c_comment_strings=1
  set hlsearch
endif

filetype plugin on


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

filetype off                  " required

set rtp+=/usr/share/vim/vimfiles/bundle/Vundle.vim
call vundle#begin('/usr/share/vim/vimfiles/bundle/')
Plugin 'VundleVim/Vundle.vim'
Plugin 'chrisbra/Colorizer'
Plugin 'chrisbra/csv.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'nblock/vim-dokuwiki'
" Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'Valloric/YouCompleteMe'
" let g:ycm_server_python_interpreter = 'ycmd-python'
Plugin 'sirver/ultisnips'
Plugin 'flazz/vim-colorschemes'
Plugin 'mswift42/vim-themes'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
let g:colorizer_auto_filetype='css,html,vim'
let g:dokuwiki_fenced_languages = ['css', 'bash', 'html', 'yaml']
let g:user_emmet_leader_key='<C-f>'

let mapleader = ";"

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

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

" use spaces instead of tabs
set expandtab
" be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

if has("autocmd")
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType bash setlocal shiftwidth=4 tabstop=4
    autocmd FileType css setlocal shiftwidth=2 tabstop=2
    autocmd FileType html setlocal shiftwidth=2 tabstop=2
    autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
endif

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

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Add a bit extra margin to the left
set foldcolumn=1
set number
set relativenumber
set numberwidth=5
silent

" ====== CUSTOM KEYBINDINGS ======
" fzf search & go-to line
nmap <leader>g :Lines<cr>
" fzf search & go-to line in current buffer
nmap <leader>gb :BLines<cr>
" fzf search history
nmap <leader>r :History:<cr>

" Fast saving
nmap <leader>w :w!<cr>
" fzf find files
nmap <leader>ff :Files<cr>

" " SEE IF THIS OVERWRITES ANY IMPRTANT BINDINGS BEFORE LEAVING THIS IN HERE...
" " easier half-page-up
" nmap <leader>m <C-U>
" " easier half-page-down
" nmap <leader>, <C-D>

" split horizontally
nmap <leader>sh :split<cr>
" split vertically 
nmap <leader>sv :vsplit<cr>

" nav pane up
nmap <leader>k <C-w>k
" nav pane down
nmap <leader>j <C-w>j
" nav pane left
nmap <leader>h <C-w>h
" nav pane right
nmap <leader>l <C-w>l

""" RESIZING PANES FIGURE OUT 
"" resize pane up
"nmap <leader>k <C-w>
"" resize pane down
"nmap <leader>j <C-w>
"" resize pane left
"nmap <leader>h <C-w>
"" resize pane right
"nmap <leader>l <C-w>

" pane exit
nmap <leader>sd <C-w>q
" pane fullscreen
nmap <leader>l <C-w>l

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


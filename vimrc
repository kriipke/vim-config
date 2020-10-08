" vim settings preferred - this must be first
if &compatible
set nocompatible
endif

" trick to ensure nocompat is set in the absence of +eval feature
silent! while 0
set nocompatible
silent! endwhile

set rtp+=/usr/local/lib/fzf
let mapleader = ";"

filetype plugin indent on
syntax on

colorscheme dim_modded
set background=dark

let g:icon_readonly = ' '
let g:icon_info = ''
let g:icon_info_alt = ''
let g:icon_warning = ' ' 
let g:icon_error = ' '
let g:icon_branch = ' '

"
" NERDTree
"
nmap <leader>e :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" start NERDTree if vim is opened without a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ' '
"
" NERDTree Git

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'',
                \ 'Staged'    :'',
                \ 'Untracked' :'',
                \ 'Renamed'   :'',
                \ 'Unmerged'  :'',
                \ 'Deleted'   :'',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'',
                \ 'Clean'     :'',
                \ 'Unknown'   :'',
                \ }

"
" lightline
"

let g:lightline = {
\ 'separator': { 'left': '', 'right': '' },
\ 'subseparator': { 'left': '', 'right': '' }
\ }

let g:lightline.component = {
\   'lineinfo': '%3l:%-2c',
\ }

let g:lightline.component_expand = {
  \  'linter_checking': 'lightline#ale#checking',
  \  'linter_infos': 'lightline#ale#infos',
  \  'linter_warnings': 'lightline#ale#warnings',
  \  'linter_errors': 'lightline#ale#errors',
  \  'linter_ok': 'lightline#ale#ok',
  \ }
let g:lightline.component_type = {
  \     'linter_checking': 'right',
  \     'linter_infos': 'right',
  \     'linter_warnings': 'warning',
  \     'linter_errors': 'error',
  \     'linter_ok': 'right',
  \ }

let g:lightline.active = {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
\   'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
\	    [ 'lineinfo' ],
\	    [ 'percent' ],
\	    [ 'fileformat', 'fileencoding', 'filetype' ] ]
\ }

let g:lightline.component_function = {
\   'gitbranch': 'LightlineFugitive',
\   'readonly': 'LightlineReadonly'
\ }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c"

function! LightlineReadonly()
return &readonly ? ' ' : ''
endfunction

function! LightlineFugitive()
if exists('*FugitiveHead')
	let branch = FugitiveHead()
	return branch !=# '' ? ' '.branch : ''
endif
return ''
endfunction

"
" Fugitive
"
nmap <leader>gs :tab :Gstatus<cr>
nmap <leader>gl :tab :Gclog<cr>
"
" ALE
"

nmap <silent> <C-e> <Plug>(ale_next_wrap)

let g:ale_sign_column_always = 1
let g:ale_sign_info = g:icon_info_alt
let g:ale_sign_warning = g:icon_warning
let g:ale_sign_error = g:icon_error

let g:ale_fixers = {}
let g:ale_fixers.html = ['prettier', 'html-beautify']
let g:ale_fixers.python = ['black', 'yapf']
let g:ale_linters.python = ['flake8', 'pylint']
let g:ale_fixers.sh = ['shfmt']
let g:ale_fixers.go = ['gofmt']
let g:ale_fixers.css = ['prettier']
let g:ale_fixers.json = ['fixjson', 'prettier', 'jq']
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']

"
" NNN
"

let $NNN_TRASH=1
let g:nnn#layout = { 'window': { 'width': 0.7, 'height': 0.8, 'highlight': 'LineNr' } }
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

"
" FZF
"

" alll this mess creates pop-up windows for :FZF commands, see:
" --> https://github.com/junegunn/fzf.vim/issues/821

fu s:snr() abort
    return matchstr(expand('<sfile>'), '.*\zs<SNR>\d\+_')
endfu
let s:snr = get(s:, 'snr', s:snr())
let g:fzf_layout = {'window': 'call '..s:snr..'fzf_window(0.9, 0.6, "Comment")'}

fu s:fzf_window(width, height, border_highlight) abort
    let width = float2nr(&columns * a:width)
    let height = float2nr(&lines * a:height)
    let row = float2nr((&lines - height) / 2)
    let col = float2nr((&columns - width) / 2)
    let top = '┌' . repeat('─', width - 2) . '┐'
    let mid = '│' . repeat(' ', width - 2) . '│'
    let bot = '└' . repeat('─', width - 2) . '┘'
    let border = [top] + repeat([mid], height - 2) + [bot]
    if has('nvim')
        let frame = s:create_float(a:border_highlight, {
            \ 'row': row,
            \ 'col': col,
            \ 'width': width,
            \ 'height': height,
            \ })
        call nvim_buf_set_lines(frame, 0, -1, v:true, border)
        call s:create_float('Normal', {
            \ 'row': row + 1,
            \ 'col': col + 2,
            \ 'width': width - 4,
            \ 'height': height - 2,
            \ })
        exe 'au BufWipeout <buffer> bw '..frame
    else
        let frame = s:create_popup_window(a:border_highlight, {
            \ 'line': row,
            \ 'col': col,
            \ 'width': width,
            \ 'height': height,
            \ 'is_frame': 1,
            \ })
        call setbufline(frame, 1, border)
        call s:create_popup_window('Normal', {
            \ 'line': row + 1,
            \ 'col': col + 2,
            \ 'width': width - 4,
            \ 'height': height - 2,
            \ })
    endif
endfu

fu s:create_float(hl, opts) abort
    let buf = nvim_create_buf(v:false, v:true)
    let opts = extend({'relative': 'editor', 'style': 'minimal'}, a:opts)
    let win = nvim_open_win(buf, v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:'..a:hl)
    return buf
endfu

fu s:create_popup_window(hl, opts) abort
    if has_key(a:opts, 'is_frame')
        let id = popup_create('', #{
            \ line: a:opts.line,
            \ col: a:opts.col,
            \ minwidth: a:opts.width,
            \ minheight: a:opts.height,
            \ zindex: 50,
            \ })
        call setwinvar(id, '&wincolor', a:hl)
        exe 'au BufWipeout * ++once call popup_close('..id..')'
        return winbufnr(id)
    else
        let buf = term_start(&shell, #{hidden: 1})
        call popup_create(buf, #{
            \ line: a:opts.line,
            \ col: a:opts.col,
            \ minwidth: a:opts.width,
            \ minheight: a:opts.height,
            \ zindex: 51,
            \ })
        exe 'au BufWipeout * ++once bw! '..buf
    endif
endfu

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

"endif

"
" BACKUP & VIMINFO
"

if $XDG_CACHE_HOME
  set backup
  silent !mkdir -p $XDG_CACHE_HOME/vim
  set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
  set backupdir=$XDG_CACHE_HOME/vim
  set directory=$XDG_CACHE_HOME/vim
else
  set backup
  silent !mkdir -p $HOME/.cache/vim
  set viminfo+=n$HOME/.cache/vim/viminfo
  set backupdir=$HOME/.cache/vim
  set directory=$HOME/.cache/vim
endif
set viminfo='20,\"50

set hidden
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

" FILE DISPLAY OPTIONS
set foldcolumn=1
set number
nmap <leader>rnu :set rnu!<cr>
set numberwidth=5
" Show @@@ in the last line if it is truncated.
set display=truncate

set laststatus=2
" " Format the status line

" always keep at least 7 lines above/below the cursor
set scrolloff=7

" LOCALE
let $LANG='en'
set langmenu=en
set encoding=UTF-8

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

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
set softtabstop=0
set tabstop=4

" INDENT
set autoindent
set smartindent
set wrap

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
au TabLeave * let g:lasttab = tabpagenr()



vmap <leader>c :Commentary<cr>
nmap <leader>d :DiffOrig<cr>

" SAVING
command W w !sudo tee % > /dev/null
nmap <leader>W :W<cr>
nmap <leader>w :w!<cr>

nmap <leader>q :q<cr>
nmap <leader>qq :qa<cr>

" TAGBAR
nmap <leader>tt :TagbarToggle<cr>
nmap <leader>t :TagbarOpenAutoClose<cr>

" FZF
nmap <leader>b :Buffers<cr>
nmap <leader>/ :Lines<cr>
nmap <leader>b/ :BLines<cr>
nmap <leader>h/ :History:<cr>
nmap <leader>// :Files<cr>

nmap <C-e>l :Lexplore!<cr>
nmap <C-e>r :Vexplore<cr>

" SPLIT WINDOW
nmap <C-j> :belowright split<cr>
nmap <C-k> :split<cr>
nmap <C-h> :vsplit<cr>
nmap <C-l> :belowright vsplit<cr>

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
nmap <leader><space> <C-w>p

" RESIZE WINDOW
nmap <leader><C-down> <C-w>-
nmap <leader><C-up> <C-w>+
nmap <leader><C-h> <C-w><
nmap <leader><C-l> <C-w>>

" MISC WINDOW
" pane exit
nmap <leader>D <C-w>q
" pane fullscreen
nmap <leader>f <C-w>l

" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

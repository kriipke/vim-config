" Vim color file
" Maintainer:   l0xy
" Last Change:  2020/06/17

" h0we:

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="h0we"

" Console Color Scheme
hi Normal       term=NONE cterm=NONE ctermfg=LightGray   ctermbg=NONE
hi NonText      term=NONE cterm=NONE ctermfg=Brown       ctermbg=NONE
hi Function     term=NONE cterm=NONE ctermfg=DarkCyan    ctermbg=NONE
hi Keyword      term=NONE cterm=BOLD ctermfg=2    ctermbg=NONE
hi Statement    term=BOLD cterm=BOLD ctermfg=08    ctermbg=NONE
hi Special      term=NONE cterm=NONE ctermfg=DarkGreen   ctermbg=NONE
hi SpecialChar  term=NONE cterm=NONE ctermfg=04        ctermbg=NONE
hi Constant     term=NONE cterm=NONE ctermfg=Blue        ctermbg=NONE
hi Comment      term=NONE cterm=NONE ctermfg=LightGray    ctermbg=NONE
hi Preproc      term=NONE cterm=NONE ctermfg=DarkGreen   ctermbg=NONE
hi Type         term=NONE cterm=NONE ctermfg=DarkMagenta ctermbg=NONE
hi Identifier   term=NONE cterm=NONE ctermfg=DarkGray  ctermbg=NONE
hi StatusLine   term=BOLD cterm=NONE ctermfg=Yellow      ctermbg=NONE
hi StatusLineNC term=NONE cterm=NONE ctermfg=Black       ctermbg=NONE
hi Visual       term=NONE cterm=NONE ctermfg=White       ctermbg=NONE
hi Search       term=NONE cterm=NONE ctermbg=NONE      ctermfg=DarkBlue
hi VertSplit    term=NONE cterm=NONE ctermfg=6	      ctermbg=NONE
hi WarningMsg   term=NONE cterm=NONE ctermfg=Blue        ctermbg=NONE
hi Error        term=NONE cterm=NONE ctermfg=DarkRed     ctermbg=NONE
hi Cursor                            ctermfg=04       ctermbg=NONE

" explore: highlighted line @ cursor
hi CursorLine	ctermfg=NONE	ctermbg=NONE
hi Directory    ctermfg=Green   ctermbg=NONE

hi FoldColumn	term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi LineNr       term=NONE cterm=NONE ctermfg=09       ctermbg=NONE

" GUI Color Scheme
hi Normal       gui=NONE     guifg=White   guibg=NONE
hi NonText      gui=NONE     guifg=#ff9999 guibg=NONE
hi Function     gui=NONE     guifg=#7788ff guibg=NONE
hi Statement    gui=BOLD     guifg=Yellow  guibg=NONE
hi Special      gui=NONE     guifg=Cyan    guibg=NONE
hi Constant     gui=NONE     guifg=#ff9900 guibg=NONE
hi Comment      gui=NONE     guifg=#99cc99 guibg=NONE
hi Preproc      gui=NONE     guifg=#33ff66 guibg=NONE
hi Type         gui=NONE     guifg=#ff5577 guibg=NONE
hi Identifier   gui=NONE     guifg=Cyan    guibg=NONE
hi StatusLine   gui=BOLD     guifg=White   guibg=NONE
hi StatusLineNC gui=NONE     guifg=Black   guibg=NONE
hi Visual       gui=NONE     guifg=White   guibg=NONE
hi Search       gui=BOLD     guibg=NONE  guifg=DarkBlue
hi VertSplit    gui=NONE     guifg=White   guibg=NONE
hi Directory    gui=NONE     guifg=Green   guibg=NONE
hi WarningMsg   gui=STANDOUT guifg=#0000cc guibg=NONE
hi Error        gui=NONE     guifg=White   guibg=NONE
hi Cursor                    guifg=White   guibg=NONE
hi LineNr       gui=NONE     guifg=#cccccc guibg=NONE
hi ModeMsg      gui=NONE     guifg=Blue    guibg=NONE
hi Question     gui=NONE     guifg=#66ff99 guibg=NONE

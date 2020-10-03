" o0 -  shell script specific vim code

packadd sh

" enable shellcheck
let b:ale_linters = ['shellcheck']

" from shellcheck man page
set makeprg=shellcheck\ -f\ gcc\ %
au BufWritePost * :silent make | redraw!

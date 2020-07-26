" o0 -  shell script specific vim code

" enable shellcheck
let b:ale_linters = ['shellcheck']

packadd sh

" from shellcheck man page
set makeprg=shellcheck\ -f\ gcc\ %
au BufWritePost * :silent make | redraw!

let g:black_virtualenv = '/usr/local/share/black'
autocmd BufWritePre *.py execute ':Black'
nnoremap <F10> :Black<cr>

let g:asyncrun_open = 6
noremap <silent><f9> :AsyncTask file-run<cr>
"noremap <silent><f10> :AsyncTask file-format<cr>
nnoremap <f11> :0,$!yapf<CR>

" https://stackoverflow.com/questions/18948491/running-python-code-in-vim
"autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>



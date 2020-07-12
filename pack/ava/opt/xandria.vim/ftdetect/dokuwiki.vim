fun IsDokuwiki()
    if match(getline(1,20),'^\(=\{2,6}\).*\1$') >=0
      set filetype=dokuwiki
    endif
endfun

autocmd BufRead,BufNewFile *.txt call IsDokuwiki()

syntax on

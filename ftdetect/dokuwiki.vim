"au! BufNewFile,BufRead *.txt if getline(1) =~ '^=\{1,6}' | setf dokuwiki | else | setf text | endif

if did_filetype()   " filetype already set..
  finish            " ..don't do these checks
endif
if getline(1) =~ '^\{1,6}'
  setfiletype dokuwiki
else
  setfiletype text
endif

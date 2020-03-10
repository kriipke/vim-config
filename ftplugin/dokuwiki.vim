vmap ;b "zdi**<c-r>z**
imap ;b **  **<esc>2hi
vmap ;i "zdi//<c-r>z//
imap ;i //  //<esc>2hi
vmap ;u "zdi__<c-r>z__
imap ;u __  __<esc>2hi
"vmap <c-s> "zdi<c-v><del><c-r>z</del>
"imap <c-s> <c-v><del></del><esc>5hi
vmap ;l "zdi[[<c-r>z]]
imap ;l [[]]<esc>2ha
vmap ;1 "zdi======= <c-r>z =======
imap ;1 =======  =======<esc>7hi
vmap ;2 "zdi====== <c-r>z ======
imap ;2 ======  ======<esc>6hi
vmap ;3 "zdi===== <c-r>z =====
imap ;3 =====  =====<esc>5hi
vmap ;4 "zdi==== <c-r>z ====
imap ;4 ====  ====<esc>4hi
vmap ;5 "zdi=== <c-r>z ===
imap ;5 ===  ===<esc>3hi
vmap ;6 "zdi== <c-r>z ==
imap ;6 ==  ==<esc>3hi
" create unordered list item
nmap ;8 :s/.*/  * &/
imap ;8 <space><space>*<space>
" create ordered list item
nmap ;- :s/.*/  - &/
imap ;- <space><space>-<space>
" increase heading by one level
imap == <Home>=<End>= <BS>
" decrease heading by one level
imap =- <Home><Del><End><BS>

" custom keybindings
" insert <kw>...</kw> tags
vmap ;k "zdi<kw><c-r>z</kw>
imap ;k <kw></kw><esc>5hi
" insert <path>...</path> tags
vmap ;p "zdi<path><c-r>z</path>
imap ;p <path></path><esc>7hi
" insert <cmdl>...</cmdl> tags
vmap ;pl "zdi<pathl><c-r>z</pathl>
imap ;pl <pathl></pathl><esc>7hi
" insert <cmd>...</cmd> tags
vmap ;cl "zdi<cmd><c-r>z</cmd>
imap ;cl <cmd></cmd><esc>6hi
" insert <cmdl>...</cmdl> tags
vmap ;c "zdi<cmd><c-r>z</cmd>
imap ;c <cmdl></cmdl><esc>7hi

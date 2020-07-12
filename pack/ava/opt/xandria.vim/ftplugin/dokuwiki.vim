vmap ;a "zdi[[<c-r>z]]<esc>
nmap ;a i[[]]<esc>2ha
imap ;a [[]]<esc>2ha

vmap ;b "zdi**<c-r>z**
nmap ;b i****<esc>2ha
imap ;b ****<esc>2hi

vmap ;u "zdi__<c-r>z__
nmap ;u i____<esc>2ha
imap ;u ____<esc>2hi

vmap ;i "zdi//<c-r>z//
nmap ;i i////<esc>2ha
imap ;i ////<esc>2hi

vmap ;1 "zdi======= <c-r>z =======
vmap ;2 "zdi====== <c-r>z ======
vmap ;3 "zdi===== <c-r>z =====
vmap ;4 "zdi==== <c-r>z ====
vmap ;5 "zdi=== <c-r>z ===
vmap ;6 "zdi== <c-r>z ==
nmap ;1 i=======  =======<esc>8hi
nmap ;2 i======  ======<esc>7hi
nmap ;3 i=====  =====<esc>6hi
nmap ;4 i====  ====<esc>5hi
nmap ;5 i===  ===<esc>4hi
nmap ;6 i==  ==<esc>3ha
imap ;1 =======  =======<esc>8hi
imap ;2 ======  ======<esc>7hi
imap ;3 =====  =====<esc>6hi
imap ;4 ====  ====<esc>5hi
imap ;5 ===  ===<esc>4hi
imap ;6 ==  ==<esc>3ha

" custom tags
vmap ;k "zdi<kw><c-r>z</kw>
vmap ;c "zdi<cmd><c-r>z</cmd>
vmap ;t "zdi<txt><c-r>z</txt>
vmap ;p "zdi<path><c-r>z</path>
vmap ;l "zdi<label><c-r>z</label>
vmap ;lw "zdi<label type="warning"><c-r>z</label>
vmap ;ld "zdi<label type="danger"><c-r>z</label>
vmap ;lp "zdi<label type="primary"><c-r>z</label>
vmap ;ls "zdi<label type="success"><c-r>z</label>
vmap ;info "zdi<callout type="info" icon="true"><c-r>z</callout>
vmap ;warn "zdi<callout type="warning" icon="true"><c-r>z</callout>
vmap ;dang "zdi<callout type="danger" icon="true"><c-r>z</callout>
vmap ;succ "zdi<callout type="success" icon="true"><c-r>z</callout>

nmap ;k i<kw></kw><esc>4hi
nmap ;c i<cmd></cmd><esc>5hi
nmap ;t i<txt></txt><esc>5hi
nmap ;p i<path></path><esc>6hi

nmap ;l i<label></label><esc>7hi
nmap ;lw i<label type="warning"></label><esc>7hi
nmap ;ld i<label type="danger"></label><esc>7hi
nmap ;lp i<label type="primary"></label><esc>7hi
nmap ;ls i<label type="success"></label><esc>7hi

nmap ;call i<callout><esc>o</callout><esc>O
nmap ;info i<callout type="info" icon="true"><esc>o</callout><esc>O
nmap ;warn i<callout type="warning" icon="true"><esc>o</callout><esc>O
nmap ;dang i<callout type="danger" icon="true"><esc>o</callout><esc>O
nmap ;succ i<callout type="success" icon="true"><esc>o</callout><esc>O

nmap ;hi i<sxh><esc>o</callout><esc>O

imap ;k <kw></kw><esc>5hi
imap ;c <cmd></cmd><esc>6hi
imap ;t <txt></txt><esc>6hi
imap ;p <path></path><esc>7hi

imap ;l <label></label><esc>7hi
imap ;lw <label type="warning"></label><esc>7hi
imap ;ld <label type="danger"></label><esc>7hi
imap ;lp <label type="primary"></label><esc>7hi
imap ;ls <label type="success"></label><esc>7hi

imap ;info <callout type="info" icon="true"></callout><esc>10ho
imap ;warn <callout type="warning" icon="true"></callout><esc>10ho
imap ;dang <callout type="danger" icon="true"></callout><esc>10ho
imap ;succ <callout type="success" icon="true"></callout><esc>10ho


" create unordered list item
nmap ;8 :s/.*/  * &/
imap ;8 <space><space>*<space>
" create ordered list item
nmap ;- o  -  
imap ;- <space><space>-<space>

" had to be changed because it interfered with the header shortcuts (e.g. ;5) for some reason
" imap == <Home>=<End>= <BS>
" imap =- <Home><Del><End><BS>
" nmap == i<Home>=<End>= <BS><esc>
" nmap =- i<Home><Del><End><BS><esc>
 
imap ;= <Home>=<End>= <BS>
imap ;- <Home><Del><End><BS>
nmap ;= i<Home>=<End>= <BS><esc>
nmap ;- i<Home><Del><End><BS><esc>

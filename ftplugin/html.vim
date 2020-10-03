packadd emmet
packadd html5-syntax

"let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
"let g:user_emmet_mode='a'    "enable all function in all mode.

" enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" remap the default <C-Y> leader:
let g:user_emmet_leader_key=','



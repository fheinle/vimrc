let php_htmlInStrings = 1
let php_folding = 1
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %f,%-G
" use real tabs
setlocal noexpandtab
" tabs are supposed to look 8 spaces wide
setlocal tabstop=8
setlocal shiftwidth=8
setlocal softtabstop=8

setlocal cindent
source ~/.vim/ftplugin/html.vim

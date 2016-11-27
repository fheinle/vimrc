if !filereadable(expand("%:p:h")."/Makefile")
    setlocal makeprg=gcc\ -Wall\ -Wextra\ -pedantic\ -ansi\ -o\ \"%\"<\ \"%\"
endif
" use real tabs
setlocal noexpandtab
" tabs are supposed to look 8 spaces wide
setlocal tabstop=8
setlocal shiftwidth=8
setlocal softtabstop=8

setlocal textwidth=80


setlocal cindent

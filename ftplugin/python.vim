setlocal cinwords=if,elif,else,for,while.try,except,finally,def,class,with
setlocal textwidth=79
ia pyhead #!/usr/bin/env python<CR># -*- coding:utf-8 -*-<CR><CR>"""
compiler pylint
set omnifunc=pythoncomplete#Complete
autocmd BufWritePost *.py call Flake8()

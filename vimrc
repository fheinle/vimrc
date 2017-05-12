" Basic {{{

if has('vim_starting')
    set nocompatible
endif

" List of Plugins

call plug#begin('~/.local/share/vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'othree/html5.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'vim-syntastic/syntastic'
Plug 'godlygeek/tabular'
Plug 'pearofducks/ansible-vim'
Plug 'gko/vim-coloresque'
Plug 'airblade/vim-gitgutter'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rodjek/vim-puppet'
Plug 'dhruvasagar/vim-table-mode'
Plug 'lifepillar/vim-solarized8'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
call plug#end()

set modelines=1

" don't clutter working directories
set backupdir=~/.local/share/vim/backup
set directory=~/.local/share/vim/backup

" no viminfo files
set viminfo=""

" tread line noise as keywords too
set isk+=_,$,@,%,#,-

" make file directory cwd
set autochdir

" }}}

" Look {{{

" theme
colo slate

" always use dark background
set background=dark

" remember to use Powerline font here for best effect
set guifont=Ubuntu\ Mono\ 12

" a = select for clipboard
" e = show gtk tabs
set guioptions=ae

" show current line
set cursorline

" show line numbers
set number
" show relative line numbers around the current line
set relativenumber

" allow multiple buffers
set hidden

" show menu on completion in command bar
set wildignorecase
set wildignore+=*.pyc,*.pyo,.git
set wildmode=list:longest,full

" which file extensions to ignore on completion
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyo

" don't repeat commands
set noshowcmd

set colorcolumn=80

if has('gui_running')
    set lines=60 columns=90
endif

" how to show whitespace
set list
set showbreak=↪

" }}}

" Searching {{{

set ignorecase
set smartcase
set hlsearch

" global replace by default
set gdefault
" }}}

" Editing {{{

" match brackets visually
set showmatch
" also match html tag brackets
set matchpairs+=<:>

" indentation
set smartindent
set expandtab
set softtabstop=4 tabstop=4 shiftwidth=4
set shiftround

" german spelling, if enabled
set spelllang=de

" when formatting comments with :gq, recognize numbered lists, continue
" comments and no line wrap
set formatoptions=qrn1

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" }}}

" Fodling {{{

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" }}}

" Keyboard {{{

" take me to your leader
let mapleader = ","
map , <Leader>

" save and exit shortcuts
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>

" show tagbar
nmap <Leader>t :TagbarToggle<CR>

" cd current dir
nnoremap <Leader>c :cd %:p:h

" disable movement keys
imap <up> <nop>
nmap <up> <nop>
imap <down> <nop>
nmap <down> <nop>
imap <left> <nop>
nmap <left> <nop>
imap <right> <nop>
nmap <right> <nop>

" scroll visual lines
nnoremap j gj
nnoremap k gk
noremap j gj
noremap k gk

" buffer switching
" <space>j for next buffer and <space>k for prev buffer
nmap <Leader>j :bnext<CR>:redraw<CR>
nmap <Leader>k :bprev<CR>:redraw<CR>

" save files using sudo if the editor is not running as root

cmap w!! w !sudo tee > /dev/null %

" close the buffer
nmap <Leader>d :bd<CR>
" buffer list
nmap <Leader>b :buffers<CR>:buffer

" close html tags with ctrl shift _
imap <silent><C-_> </<C-x><C-o>

" toggle folds shortcut
map <silent><leader>f za<CR>

map <silent><leader>h <Plug>GitGutterPrevHunk
map <silent><leader>l <Plug>GitGutterNextHunk
" }}}

if executable("ag")
        set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
        set grepformat=%f:%l:%c:%m,%f:%l:%m
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        let g:ctrlp_use_caching = 0
endif

nnoremap # :grep<SPACE>

map <F4> :sp %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <c-o> :CtrlPBuffer<CR>

au BufRead,BufNewFile *.lco setfiletype tex

" syntastic


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:styntastic_c_check_header = 1
let g:syntastic_c_compiler_options = ' -ansi -pedantic -Wall -Wextra'
" vim:foldmethod=marker:foldlevel=0

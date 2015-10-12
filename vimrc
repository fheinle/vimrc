if has('vim_starting')
    set nocompatible
    execute pathogen#infect()
endif

" Basic {{{
" reload vimrc on changes
au BufWritePost .vimrc so ~/.vimrc
filetype plugin indent on
set modelines=1
" don't clutter working directories
set backupdir=~/.vimbackup
set directory=~/.vimbackup
" no viminfo
set viminfo=""
" use system clipboard
if has ('unnameplus')
    set clipboard=unnamed,unnamedplus
endif
" tread line noise as keywords too
set isk+=_,$,@,%,#,-
" make file directory cwd
set autochdir
" }}}

" Look {{{
" syntax highlighting
syn on
" always use dark background
set background=dark
" solarized theme
colo badwolf
"if has("gui running")
"    colo solarized
"else
"    colo desert
"endif
" remember to use Powerline font here for best effect
set guifont=Droid\ Sans\ Mono\ For\ Powerline\ 9
" assume 256 color terminal
set t_Co=256
" always show the status bar
set laststatus=2
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
" keep at least 3 more lines visible
set scrolloff=3
" show menu on completion in command bar
set wildmenu
set wildignorecase
set wildignore+=*.pyc,*.pyo,.git
set wildmode=list:longest,full
" which file extensions to ignore on completion
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyo
" don't repeat commands
set noshowcmd
let g:airline_powerline_fonts = 0
if has('gui_running')
    set lines=50 columns=84
    set colorcolumn=80
    let g:airline_powerline_fonts = 1
endif
if !has('gui_running')
    let g:airline_theme='powerlineish'
    "let g:airline_left_sep=''
    "let g:airline_right_sep=''
    "let g:airline_section_z=''
endif
" how to show whitespace
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
" }}}

" Searching {{{
" global replace by default
set gdefault
set ignorecase
set smartcase
set incsearch
set hlsearch
" }}}

" Editing {{{
" match brackets visually
set showmatch
" also match html tag brackets
set matchpairs+=<:>
" indentation
set autoindent smartindent
set expandtab smarttab
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
set backspace=indent,eol,start
" take me to your leader
" let mapleader = "\<Space>"
map <Space> <leader>
" open with <space> o, write with <space> w
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>
" show tagbar
nmap <Leader>t :TagbarToggle<CR>
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
" close the buffer
nmap <Leader>d :bd<CR>
" buffer list
nmap <leader>b :buffers<CR>:buffer
" close html tags
imap <silent><C-_> </<C-x><C-o>
" exit input mode by typing jj
inoremap jj <Esc>
map <silent><leader>f za<CR>
" }}}

" Plugin settings {{{
" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}

" vim:foldmethod=marker:foldlevel=0

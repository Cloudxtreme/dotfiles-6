"
" VIM
"
" Author: Sebastian Potasiak <sebpot@protonmail.com>
" Date:   2015-12-06
" File:   ~/.vimrc
"

" Vundle {{{

" Disable vi compatibility
set nocompatible

" Disable filetype detection
filetype off

" Set runtime path
set rtp+=~/.vim/bundle/Vundle.vim

" Start Vundle plugins block
call vundle#begin()

" Vundle plugin
Plugin 'VundleVim/Vundle.vim'

" Startify
Plugin 'mhinz/vim-startify'

" Gruvbox color scheme
Plugin 'morhetz/gruvbox'

" Vim Airline
Plugin 'bling/vim-airline'

" NERDTree
Plugin 'scrooloose/nerdtree'

" The Silver Searcher
Plugin 'rking/ag.vim'

" CtrlP
Plugin 'kien/ctrlp.vim'

" Git syntax
Plugin 'tpope/vim-git'

" Git wrapper
Plugin 'tpope/vim-fugitive'

" Git gutter
Plugin 'airblade/vim-gitgutter'

" Virtualenv
Plugin 'jmcantrell/vim-virtualenv'

" Surround
Plugin 'tpope/vim-surround'

" Completion
Plugin 'Valloric/YouCompleteMe'

" Syntax checking
Plugin 'scrooloose/syntastic'

" SCSS file syntax
Plugin 'cakebaker/scss-syntax.vim'

" i3 file syntax
Plugin 'PotatoesMaster/i3-vim-syntax'

" Markdown file syntax
Plugin 'plasticboy/vim-markdown'

" End Vundle plugins block
call vundle#end()

" Restore filetype detection
filetype plugin indent on

" }}}
" General {{{

" Encoding
set encoding=utf-8

" Tab width
set tabstop=2

" Tab width when editing
set softtabstop=2

" Tab width when indenting in normal mode
set shiftwidth=2

" Emit spaces instead of tabs
set expandtab

" Automatically indent on newline
set autoindent

" Enable line breaks
set linebreak

" Indent continuation line
set breakindent

" Copy previous indent on autoindenting
set copyindent

" Enable folding
set foldenable

" Use folding based on code indent
set foldmethod=indent

" Set minimum folding depth
set foldlevelstart=10

" Set maximum nested folds
set foldnestmax=10

" Enable modelines
set modeline

" Command history
set history=1000

" Ignore character case when searching
set ignorecase

" Reload files on change
set autoread

" Write files when switching buffers
set autowriteall

" Set update time
set updatetime=1000

" Boost in terminal
set ttyfast

" Set terminal title
set title

" }}}
" UI {{{

" Show line numbers
set number

" Show cursor position
set ruler

" Show colored column
set colorcolumn=81

" Highlight current line
set cursorline

" Show current command
set showcmd

" Command completion
set wildmenu

" Show matching brackets
set showmatch

" Use incremental search
set hlsearch

" Highlight search matches
set hlsearch

" Hide vertical bars in split separator
set fillchars+=vert:\ 

" Always show status line
set laststatus=2

" Open horizontal splits on the bottom
set splitbelow

" Open vertical splits on the right
set splitright

" }}}
" Color {{{

" Enable syntax highlighting
syntax on

" Use dark background
set background=dark

" Use colorscheme
colorscheme gruvbox

" }}}
" Plugins {{{

" Startify
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_list_order = [
      \ ['    Bookmarks'], 'bookmarks',
      \ ['    Sessions'], 'sessions',
      \ ['    Recently used in directory'], 'dir',
      \ ['    Recently used'], 'files'
      \ ]
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1

" CtrlP
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'VL',
      \ '' : 'VB',
      \ 's'  : 'S',
      \ 'S'  : 'SL',
      \ '' : 'SB',
      \ }

" NERDTree
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 32
let NERDTreeIgnore = [
      \ '\.aux$', '\.bak$', '\.class$', '\.jpg$', '\.nav$', '\.o$', '\.obj$',
      \ '\.out$', '\.pdf$', '\.png$', '\.pyc$', '\.snm$', '\.sty$',
      \ '\.sublime-project$', '\.sublime-workspace$', '\.tmp$', '\.toc$'
      \ ]

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1

" Syntastic
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = '∆'
let g:syntastic_style_warning_symbol = '≈'

" Virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" }}}
" Functions {{{

" Toggle line numbers mode (relative / absolute)
function! NumberToggle()
  if (&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunction

" }}}
" Input {{{

" Set leader key
let mapleader=' '
nnoremap <space> <nop>

" Switch buffers
nnoremap <C-i> :bn<CR>
nnoremap <C-o> :bp<CR>

" Switch splits
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" Resize buffers
nnoremap <silent> <Left> :vertical resize -1<CR>
nnoremap <silent> <Down> :resize -1<CR>
nnoremap <silent> <Up> :resize +1<CR>
nnoremap <silent> <Right> :vertical resize +1<CR>

" Toggle folding
nnoremap <leader><space> za

" Treat overflowing lines as line breaks
nnoremap j gj
nnoremap k gk

" Move to beginning / end of the line
nnoremap B ^
nnoremap E $
vnoremap B ^
vnoremap E $

" Select last inserted text
nnoremap gV `[v`]

" Move lines in normal and visual mode
nnoremap j :m+<CR>==
nnoremap k :m-2<CR>==
vnoremap j :m '>+1<CR>gv=gv
vnoremap k :m '<-2<CR>gv=gv

" Format code
nnoremap <leader>f gqap
vnoremap <leader>f gq

" Disable search highlighting
nnoremap <silent> <leader>h :nohlsearch<CR>

" Toggle line numbers mode
nnoremap <silent> <leader>n :call NumberToggle()<CR>

" Save session
nnoremap <leader>s :SSave<CR>

" Toggle NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>

" }}}
" File {{{

" Disable swapfiles
set noswapfile

" Enable backup
set backup
set backupdir=~/.vim/backup

" }}}
" Autocommands {{{

" Auto write
autocmd FocusLost * silent! :wa
autocmd TabLeave * silent! :wa
autocmd CursorHold * update
autocmd CursorHold,CursorHoldI * update

" CSS files
autocmd FileType css
      \ setlocal omnifunc=csscomplete#CompleteCSS

" HTML files
autocmd FileType html,markdown
      \ setlocal omnifunc=htmlcomplete#CompleteTags

" JavaScript files
autocmd FileType javascript
      \ setlocal omnifunc=javascriptcomplete#CompleteJS

" Python files
autocmd FileType python
      \ set omnifunc=pythoncomplete#Complete |
      \ setlocal tabstop=4 |
      \ setlocal softtabstop=4 |
      \ setlocal shiftwidth=4 |
      \ setlocal commentstring=#\ %s |
      \ setlocal colorcolumn=80 |
      \ let python_highlight_all=1

" XML files
autocmd FileType xml
      \ setlocal omnifunc=xmlcomplete#CompleteTags

" TeX files
autocmd FileType tex
      \ setlocal colorcolumn= |
      \ setlocal lazyredraw

" Close window when only NERDTree is present
autocmd BufEnter *
      \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) |
      \ q |
      \ endif

" }}}
" vim:ft=vim:foldmethod=marker:foldlevel=0

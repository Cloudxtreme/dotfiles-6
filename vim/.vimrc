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

" Surround
Plugin 'tpope/vim-surround'

" Completion
Plugin 'Shougo/neocomplete.vim'

" LaTeX
Plugin 'lervag/vimtex'

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

" CtrlP
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" NERDTree
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 32
let NERDTreeIgnore = [
    \ '\.aux$', '\.bak$', '\.class$', '\.jpg$', '\.nav$', '\.o$', '\.obj$',
    \ '\.out$', '\.pdf$', '\.png$', '\.pyc$', '\.snm$', '\.sty$',
    \ '\.sublime-project$', '\.sublime-workspace$', '\.tmp$', '\.toc$'
    \ ]

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

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

" Neocomplete CR function
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
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

" Disable search highlighting
nnoremap <leader>h :nohlsearch<CR>

" Toggle line numbers mode
nnoremap <leader>n :call NumberToggle()<CR>

" Save session
nnoremap <leader>s :mksession

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Neocomplete mappings
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" }}}
" File {{{

" Disable swapfiles
set noswapfile

" Enable backup
set backup
set backupdir=~/.vim/backup

" }}}
" Autocommands {{{

" CSS files
autocmd FileType css
      \ setlocal omnifunc=csscomplete#CompleteCSS

" HTML files
autocmd FileType html
      \ setlocal omnifunc=htmlcomplete#CompleteTags

" JavaScript files
autocmd FileType javascript
      \ setlocal omnifunc=javascriptcomplete#CompleteJS

" Python files
autocmd FileType python
      \ setlocal omnifunc=pythoncomplete#Complete |
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
      \ setlocal colorcolumn=

" Close window when only NERDTree is present
autocmd BufEnter *
      \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) |
      \ q |
      \ endif

" }}}
" vim:ft=vim:foldmethod=marker:foldlevel=0

"
" Neovim configuration
"
" Author: Sebastian Potasiak <sebpot@protonmail.com>
" Date:   2015-12-15
" File:   ~/.config/nvim/init.vim
" 
" Plug {{{
call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'kien/ctrlp.vim'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'Shougo/deoplete.nvim'
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rvm', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
call plug#end()
" }}}
" General {{{
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set linebreak
set breakindent
set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10
set modeline
set history=1000
set ignorecase
" }}}
" UI {{{
set number
set cursorline
set showmatch
set hlsearch
set splitbelow
set splitright
" }}}
" Colors {{{
set background=dark
colorscheme gruvbox
" }}}
" Airline {{{
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
" }}}
" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}
" Deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}
" NERDTree {{{
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 32
let NERDTreeIgnore = [
      \ '\.aux$', '\.bak$', '\.class$', '\.jpg$', '\.nav$', '\.o$', '\.obj$',
      \ '\.out$', '\.pdf$', '\.png$', '\.pyc$', '\.snm$', '\.sty$',
      \ '\.sublime-project$', '\.sublime-workspace$', '\.tmp$', '\.toc$'
      \ ]
" }}}
" Startify {{{
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_list_order = [
      \ ['    Bookmarks'], 'bookmarks',
      \ ['    Sessions'], 'sessions',
      \ ['    Recently used in directory'], 'dir',
      \ ['    Recently used'], 'files'
      \ ]
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
" }}}
" Syntastic {{{
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = '∆'
let g:syntastic_style_warning_symbol = '≈'
" }}}
" Virtualenv {{{
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
function! NumberToggle()    " Toggle relative / no relative line numbers
  if (&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunction
" }}}
" Input {{{
let mapleader=' '
nnoremap <space> <nop>
nnoremap <C-i> :bn<CR>
nnoremap <C-o> :bp<CR>
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <silent> <Left>  :vertical resize -1<CR>
nnoremap <silent> <Down>  :resize -1<CR>
nnoremap <silent> <Up>    :resize +1<CR>
nnoremap <silent> <Right> :vertical resize +1<CR>
nnoremap <leader><space> za
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
vnoremap B ^
vnoremap E $
nnoremap gV `[v`]
nnoremap j :m+<CR>==
nnoremap k :m-2<CR>==
vnoremap j :m '>+1<CR>gv=gv
vnoremap k :m '<-2<CR>gv=gv
nnoremap <leader>f gqap
vnoremap <leader>f gq
nnoremap <silent> <leader>h :nohlsearch<CR>
nnoremap <silent> <leader>n :call NumberToggle()<CR>
nnoremap <leader>s :SSave<CR>
map <silent> <C-n> :NERDTreeToggle<CR>
" }}}
" Files {{{
set noswapfile
set backup
set backupdir=~/.vim/backup
" }}}
" Autocommands {{{
autocmd FileType css
      \ setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown
      \ setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript
      \ setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python
      \ set omnifunc=pythoncomplete#Complete |
      \ setlocal tabstop=4 |
      \ setlocal softtabstop=4 |
      \ setlocal shiftwidth=4 |
      \ setlocal commentstring=#\ %s |
      \ setlocal colorcolumn=80 |
      \ let python_highlight_all=1
autocmd FileType xml
      \ setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType tex
      \ setlocal colorcolumn= |
      \ setlocal lazyredraw
autocmd BufEnter *
      \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) |
      \ q |
      \ endif
" }}}
" vim:foldmethod=marker:foldlevel=0

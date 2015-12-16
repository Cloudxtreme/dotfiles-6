" ##############################################################################
" ### Neovim configuration                                                   ###
" ### Author: Sebastian Potasiak <sebpot@protonmail.com>                     ###
" ##############################################################################

" ==============================================================================
" 1.0 Plugin manager (Plug) settings
" ==============================================================================
" {{{

call plug#begin('~/.config/nvim/plugged')

" ------------------------------------------------------------------------------
" 1.1 Language agnostic plugins
" ------------------------------------------------------------------------------
" {{{

" Auto close parentheses
Plug 'cohama/lexima.vim'

" Commenting support (<leader>c)
Plug 'scrooloose/nerdcommenter'

" Syntax checking
Plug 'scrooloose/syntastic'

" Surroundings management
Plug 'tpope/vim-surround'

" Code completion
Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py --clang-completer' }

" }}}

" ------------------------------------------------------------------------------
" 1.2 Ruby / Rails
" ------------------------------------------------------------------------------
" {{{

" Ruby syntax
Plug 'vim-ruby/vim-ruby'

" Slim syntax
Plug 'slim-template/vim-slim'

" Haml syntax
Plug 'tpope/vim-haml'

" Minitest syntax
Plug 'sunaku/vim-ruby-minitest'

" Rails support (:A, :R, :Rmigration, :Rextract)
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }

" Bundler support
Plug 'tpope/vim-bundler', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }

" RVM support
Plug 'tpope/vim-rvm', { 'for': 'ruby' }

" Auto instert 'end' tags in ruby
Plug 'tpope/vim-endwise', { 'for': 'ruby' }

" String interpolation helper
Plug 'p0deje/vim-ruby-interpolation', { 'for': 'ruby' }

" Refactoring tools
Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }

" }}}

" ------------------------------------------------------------------------------
" 1.3 Javascript
" ------------------------------------------------------------------------------
" {{{

" JS syntax
Plug 'othree/yajs.vim'
"
" JS libs syntax (React, Angular)
Plug 'othree/javascript-libraries-syntax.vim'
"
" JSX syntax
Plug 'mxw/vim-jsx' | Plug 'pangloss/vim-javascript'
"
" Typescript syntax
Plug 'leafgarland/typescript-vim'
"
" JSON syntax
Plug 'sheerun/vim-json'

" }}}

" ------------------------------------------------------------------------------
" 1.4 HTML / CSS
" ------------------------------------------------------------------------------
" {{{

" HTML5 syntax
Plug 'othree/html5.vim'

" SCSS syntax
Plug 'cakebaker/scss-syntax.vim'

" CSS color highlighter
Plug 'gorodinskiy/vim-coloresque', { 'for': ['css', 'sass', 'scss', 'less'] }

" }}}

" ------------------------------------------------------------------------------
" 1.5 Other languages
" ------------------------------------------------------------------------------
" {{{

" Elixir syntax
Plug 'elixir-lang/vim-elixir'

" Python syntax
Plug 'mitsuhiko/vim-python-combined'

" Elm
Plug 'lambdatoast/elm.vim'

" Markdown syntax and helpers
Plug 'plasticboy/vim-markdown'

" Tmux syntax
Plug 'tejr/vim-tmux'

" Git syntax
Plug 'tpope/vim-git'

" i3 configuration syntax
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }

" Dockerfile
Plug 'honza/dockerfile.vim'

" Yaml indentation
Plug 'martin-svk/vim-yaml'

" Crystal lang
Plug 'rhysd/vim-crystal'

" }}}

" ------------------------------------------------------------------------------
" 1.6 Fuzzy search
" ------------------------------------------------------------------------------
" {{{

" The Silver Searcher
Plug 'rking/ag.vim'

" CtrlP
Plug 'kien/ctrlp.vim'

" Ack
Plug 'mileszs/ack.vim'

" }}}

" ------------------------------------------------------------------------------
" 1.7 User interface improvements
" ------------------------------------------------------------------------------
" {{{

" NERDTree file tree browser
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

" Lightweight powerline-like status line
Plug 'bling/vim-airline'

" Gruvbox color scheme
Plug 'morhetz/gruvbox'

" }}}

" ------------------------------------------------------------------------------
" 1.9 External tools integration
" ------------------------------------------------------------------------------
" {{{

" Git commands
Plug 'tpope/vim-git'

" Git gutter (changes on line numbers)
Plug 'airblade/vim-gitgutter'

" }}}

" ------------------------------------------------------------------------------
" 1.10 Other
" ------------------------------------------------------------------------------
" {{{

" Start screen
Plug 'mhinz/vim-startify'

" Set of common defaults
Plug 'tpope/vim-sensible'

" Close buffers
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

" }}}

call plug#end()

" }}}

" ==============================================================================
" 2.0 General settings
" ==============================================================================
" {{{

set shell=/bin/zsh    " Set shell to Z Shell
set number            " Line numbers on
set cursorline        " Highlight current line
set textwidth=80      " Text width to 80 characters
set cmdheight=1       " Command line height
set pumheight=10      " Completion window max height
set modeline          " Use modelines
set history=1000      " Keep history of latest 1000 commands
set mouse=            " Disable mouse support
set showmatch         " Highlight matching brackets / parentheses

" ------------------------------------------------------------------------------
" 2.1 Indents
" ------------------------------------------------------------------------------
" {{{

set tabstop=2         " Number of visual spaces per indent
set softtabstop=2     " Number of spaces per indent when editing
set shiftwidth=2      " Number of spaces per indent in reindent operations
set expandtab         " Use spaces instead of tabs

" }}}

" ------------------------------------------------------------------------------
" 2.2 Line breaks
" ------------------------------------------------------------------------------
" {{{

set linebreak         " Break lines visually when text exceeds window width
set breakindent       " Indent line continuations to same level as original

" }}}

" ------------------------------------------------------------------------------
" 2.3 Folding
" ------------------------------------------------------------------------------
" {{{

set foldenable        " Enable folding
set foldmethod=marker " Fold basing on indent
set foldlevelstart=1  " Start folding from 1st level
set foldnestmax=10    " Nest maximum 10 foldings
set fillchars="fold: "

" }}}

" ------------------------------------------------------------------------------
" 2.4 Search
" ------------------------------------------------------------------------------
" {{{

set ignorecase        " Ignore case
set smartcase         " Use case sensitive search when contains uppercase
set wrapscan          " Continue search from top after reaching bottom
set hlsearch          " Highlight after search

" }}}

" ------------------------------------------------------------------------------
" 2.5 Splits
" ------------------------------------------------------------------------------
" {{{

set splitbelow        " Create split below current
set splitright        " Create split right of the current

" }}}

" ------------------------------------------------------------------------------
" 2.6 Timeouts
" ------------------------------------------------------------------------------
" {{{

set notimeout         " Disable timeout
set ttimeout          " Enable timeout for mappings
set ttimeoutlen=10    " Set timeout for mappings to 10

" }}}

" ------------------------------------------------------------------------------
" 2.7 Persistent undo
" ------------------------------------------------------------------------------
" {{{

if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif

" }}}

" ------------------------------------------------------------------------------
" 2.8 Whitespace characters
" ------------------------------------------------------------------------------
" {{{

" Show whitespace characters
set list

" Whitespace characters representations
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:·

" Show character on line break
set showbreak=↪

" }}}

" ------------------------------------------------------------------------------
" 2.9 Filetypes
" ------------------------------------------------------------------------------
" {{{

filetype plugin on    " Enable filetype plugins
filetype indent on    " Enable filetype indents

" }}}

" ------------------------------------------------------------------------------
" 2.10 Omni completion
" ------------------------------------------------------------------------------
" {{{

set completeopt-=preview  " Don't show preview scratch buffers

" Ignore filetypes
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" }}}

" ------------------------------------------------------------------------------
" 2.11 Ctags
" ------------------------------------------------------------------------------
" {{{

set tags+=.tags       " Tags in .tags file

" }}}

" ------------------------------------------------------------------------------
" 2.12 Colorscheme
" ------------------------------------------------------------------------------
" {{{

set background=dark   " Use dark color scheme
colorscheme gruvbox   " Use gruvbox color scheme

" }}}

" }}}

" ==============================================================================
" 3.0 Plugins
" ==============================================================================
" {{{

" ------------------------------------------------------------------------------
" 3.1 Airline
" ------------------------------------------------------------------------------
" {{{

" Use powerline fonts
let g:airline_powerline_fonts = 1

" Powerline left separator
let g:airline_left_sep = ''

" Powerline right separator
let g:airline_right_sep = ''

" Mode names abbreviations
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

" ------------------------------------------------------------------------------
" 3.2 CtrlP
" ------------------------------------------------------------------------------
" {{{

" Show CtrlP split on the bottom
let g:ctrlp_match_window = 'bottom,order:ttb'

" Jump to an open buffer if already opened
let g:ctrlp_switch_buffer = 0

" Use working path
let g:ctrlp_working_path_mode = 0

" Use The Silver Searcher as search command
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" }}}

" ------------------------------------------------------------------------------
" 3.3 NERDTree
" ------------------------------------------------------------------------------
" {{{

" Use minimal user interface
let g:NERDTreeMinimalUI = 1

" Show NERDTree on the left side of the screen
let g:NERDTreeWinPos = 'left'

" Set NERDTree split size to 32 columns
let g:NERDTreeWinSize = 32

" Highlight cursor line in NERDTree split
let g:NERDTreeHighlightCursorline = 1

" Respect wildignore setting
let g:NERDTreeRespectWildIgnore = 1

" Ignore filetypes
let NERDTreeIgnore = [
      \ '\.aux$', '\.bak$', '\.class$', '\.jpg$', '\.nav$', '\.o$', '\.obj$',
      \ '\.out$', '\.pdf$', '\.png$', '\.pyc$', '\.snm$', '\.sty$',
      \ '\.sublime-project$', '\.sublime-workspace$', '\.tmp$', '\.toc$'
      \ ]

" }}}

" ------------------------------------------------------------------------------
" 3.4 Startify
" ------------------------------------------------------------------------------
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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
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
" YouCompleteMe {{{
let g:ycm_autoclose_preview_window_after_completion = 1
" }}}

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
  inoremap kk <Esc>
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
  map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
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
        \ setlocal omnifunc=javascriptcomplete#CompleteJS |
        \ setlocal colorcolumn=81
  autocmd FileType python
        \ setlocal omnifunc=pythoncomplete#Complete |
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
        \ setlocal commentstring=#\ %s |
        \ setlocal colorcolumn=80 |
        \ let python_highlight_all=1
  autocmd FileType tex
        \ setlocal colorcolumn= |
        \ setlocal lazyredraw
  autocmd FileType vim
        \ setlocal colorcolumn=81
  autocmd FileType xml
        \ setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd BufEnter *
        \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) |
        \ q |
        \ endif
  autocmd BufWritePre *
        \ :%s/\s\+$//e
  " }}}
  " vim:foldmethod=marker:foldlevel=0

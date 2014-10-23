if !1 | finish | endif

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'epeli/slimux'
NeoBundle 'godlygeek/tabular'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'jamessan/vim-gnupg'
NeoBundle 'jtratner/vim-flavored-markdown'
NeoBundle 'moll/vim-node'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jimenezrick/vimerl'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'zweifisch/pipe2eval'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

syntax on

set autochdir
set autoindent
set autoread
set backspace=indent,eol,start
set encoding=utf-8
set expandtab
set softtabstop=2
set tabstop=8
set wildmenu
set wildmode=longest,list,full

set ignorecase
set incsearch
set showmatch
set smartcase

let &colorcolumn=join(range(81,999),",")
set background=light
set cursorline
set formatoptions=tcq
set laststatus=2
set list
set noerrorbells
set nofoldenable
set noshowcmd
set nostartofline
set nowrap
set number
set ruler
set scrolloff=3
set shiftwidth=2
set showmode
set sidescroll=5
set sidescrolloff=3
set term=xterm-256color
set textwidth=80
set title
set ttyfast
set visualbell

set history=1000
set nobackup
set noswapfile
set undodir=$HOME/.vimundo
set undolevels=1000

set autowrite
set clipboard=unnamed
set hidden
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc

colorscheme Tomorrow
highlight Normal ctermbg=NONE
let g:lightline = {
  \ 'colorscheme': 'Tomorrow',
  \ }
let g:tmuxline_powerline_separators = 0

set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

set ttimeoutlen=10
augroup FastEscape
    au!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END

map <F2> :set paste<CR>i
imap <F2> <ESC>:set paste<CR>i<Right>
au InsertLeave * set nopaste

map <C-c><C-c> :SlimuxREPLSendLine<CR>
vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>
function! SlimuxPre_javascript(target_pane)
  call system("tmux send-keys -t " . a:target_pane . " C-v")
endfunction
function! SlimuxPost_javascript(target_pane)
  call system("tmux send-keys -t " . a:target_pane . " C-d")
endfunction

let mapleader = ','
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>l :Align
nmap <leader><space> :call whitespace#strip_trailing()<CR>
nmap <leader>c <Plug>Kwbd
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

cmap w!! %!sudo tee > /dev/null %

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END


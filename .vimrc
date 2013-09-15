set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim

  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'molokai'
NeoBundle 'neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Lokaltog/powerline'
NeoBundleCheck

syntax on
filetype plugin on
set encoding=utf-8
set t_Co=256

set autoindent
set browsedir=buffer
set expandtab
set hidden
set incsearch
set number
set shiftwidth=2
set showmatch
set ignorecase
set smartindent
set tabstop=2
set cursorline
set showtabline=2

let g:vimfiler_as_default_explorer = 1
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"

set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

set directory=~/.vim/tmp
set backupdir=~/.vim/tmp

imap jj <Esc>

set laststatus=2

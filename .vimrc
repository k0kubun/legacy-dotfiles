set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim

  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'molokai'
NeoBundleCheck

syntax on
filetype plugin on
set encoding=utf-8
set t_Co=256

set autoindent
set nobackup
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

set directory=~/.vim/tmp

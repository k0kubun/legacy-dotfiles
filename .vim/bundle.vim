set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

" Language
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-haml'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'

" Completion
NeoBundle 'neocomplcache'

" Skin
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim' }
NeoBundle 'w0ng/vim-hybrid'

" Additional
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'osyo-manga/vim-over'

" ctags
NeoBundle 'szw/vim-tags'

" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'yuku-t/unite-git'

" Git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'

NeoBundleCheck

filetype plugin indent on

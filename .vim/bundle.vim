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
NeoBundle 'vim-scripts/coq-syntax'
NeoBundle 'eagletmt/coqtop-vim'
NeoBundle 'haruyama/scheme.vim'
NeoBundleLazy 'Blackrush/vim-gocode', {"autoload": {"filetypes": ['go']}}

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
NeoBundle 'yuku-t/unite-git'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'airblade/vim-gitgutter'

NeoBundleCheck

filetype plugin indent on


set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

" Language
NeoBundle 'vim-ruby/vim-ruby'
" NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-haml'
NeoBundle 'slim-template/vim-slim'
" NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'
" NeoBundle 'vim-scripts/coq-syntax'
" NeoBundle 'eagletmt/coqtop-vim'
" NeoBundle 'haruyama/scheme.vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'vim-jp/vim-go-extra'
" NeoBundleLazy 'Blackrush/vim-gocode', {"autoload": {"filetypes": ['go']}}
NeoBundle 'wannesm/wmnusmv.vim'
" NeoBundleLazy 'shinka-cb/smv_vim', {'autoload':{'filetypes':['smv']}}
" NeoBundle 'datsuns/vim-smv'
NeoBundle 'vim-scripts/applescript.vim'

" Completion
NeoBundle 'Shougo/neocomplcache.vim'
" NeoBundle 'Shougo/neocomplete.vim'

" Skin
NeoBundle 'Lokaltog/powerline', 'da6667b', { 'rtp' : 'powerline/bindings/vim' }
" NeoBundle 'bling/vim-airline'
NeoBundle 'w0ng/vim-hybrid'

" Editing
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'thinca/vim-prettyprint'
NeoBundle 'haya14busa/incsearch.vim'

" ctags
" NeoBundle 'szw/vim-tags'

" Unite
NeoBundle 'Shougo/unite.vim'
" NeoBundle 'yuku-t/unite-git'
NeoBundle 'k0kubun/unite-git-files'
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
" NeoBundle 'gregsexton/gitv'
NeoBundle 'airblade/vim-gitgutter'

NeoBundleCheck

filetype plugin indent on

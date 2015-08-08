set nocompatible

" NeoBundle
filetype plugin indent off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'Shougo/vimproc', { 'build': { 'mac': 'make -f make_mac.mak', 'unix': 'make -f make_unix.mak' } }
NeoBundleLazy 'Shougo/neocomplete.vim', { "autoload": { "insert": 1 } }
NeoBundleLazy 'Shougo/unite.vim', { 'autoload': { 'commands': ['Unite', 'UniteWithBufferDir'] } }
NeoBundleLazy 'k0kubun/unite-git-files', { 'depends': 'Shougo/unite.vim', 'autoload': { 'unite_sources': ['git_files'] } }
NeoBundleLazy 'tpope/vim-haml', { 'autoload': {'filetypes': 'haml'} }
NeoBundleLazy 'kchmck/vim-coffee-script', { 'autoload': { 'filetypes': ['coffee'] } }
NeoBundleLazy 'airblade/vim-gitgutter', { 'autoload': { 'insert': 1 } }
NeoBundleLazy 'bronson/vim-trailing-whitespace', { 'autoload': { 'commands': ['FixWhitespace'] } }
NeoBundleLazy 'osyo-manga/vim-over', { 'autoload': { 'commands': ['OverCommandLine'] } }
NeoBundleLazy 'tpope/vim-fugitive', { 'autoload': { 'commands': ['Gblame'] } }
NeoBundleCheck

source ~/.vim/basic.vim
source ~/.vim/indentation.vim

source ~/.vim/skin.vim
source ~/.vim/plugin.vim
source ~/.vim/bind.vim

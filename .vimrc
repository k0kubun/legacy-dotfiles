set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim

  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'basyura/unite-rails'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim' }
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-haml'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundleCheck

syntax on
filetype plugin on
set encoding=utf-8
set t_Co=256
colorscheme hybrid

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

" 自動コメント防止
autocmd FileType * set formatoptions-=ro

noremap <Space>j <C-f>
noremap <Space>k <C-b>

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap [Tag] <Nop>
nmap <Space> [Tag]
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" tt 新しいタブ
map <silent> [Tag]t :tablast <bar> tabnew<CR>
" te タブを閉じる 
map <silent> [Tag]e :tabclose<CR>
" tp 次のタブ
map <silent> [Tag]p :tabnext<CR>
" to 前のタブ
map <silent> [Tag]o :tabprevious<CR>

nnoremap [Tag]h <C-w>h
nnoremap [Tag]l <C-w>l

" Ruby syntax highlight
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Capfile set filetype=ruby

" Explorer
nnoremap <silent> ;e :e<Space>.<CR>

" Unite.vim configuration
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ;u :<C-u>Unite buffer file_rec<CR>
imap ;q <C-u><C-h> 

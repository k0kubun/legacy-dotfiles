" Esc
noremap <C-e> <Esc>
noremap <C-E> <Esc>
inoremap <C-e> <Esc>
inoremap <C-E> <Esc>
cnoremap <C-e> <Esc>
cnoremap <C-E> <Esc>

" 移動
noremap gj 6j
noremap gk 6k

" スクロール
noremap <Space>j <C-f>
noremap <Space>k <C-b>

" The prefix key.
nnoremap [Tag] <Nop>
nmap <Space> [Tag]
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" tabline
map <silent> [Tag]t :tablast <bar> tabnew <bar> Explore <bar> vs<CR>
map <silent> [Tag]e :tabclose<CR>
map <silent> [Tag]p :tabnext<CR>
map <silent> [Tag]o :tabprevious<CR>

" ウィンドウ切り替え
nnoremap [Tag]h <C-w>h
nnoremap [Tag]l <C-w>l

" Explore
nnoremap <silent> ;e :<C-u>Explore<CR>

" End Vim
nnoremap <silent> ;xc :qa!<CR>

" Unite.vim
nnoremap <silent> ;u :<C-u>Unite buffer file_rec/git<CR>
imap ;q <C-u><C-h>

" ctags
nnoremap <silent> [Tag]f <C-]>
nnoremap <silent> [Tag]u <C-o>
nnoremap <silent> [Tag]i <C-i>

" Hash Rocket
command! -bar -range=% NotRocket :<line1>,<line2>s/:\([a-z_]\+\)\s*=>/\1:/g
vnoremap <silent> gr :NotRocket<CR>

" Source .vimrc
noremap <silent> ;s :<C-u>source<Space>~/.vimrc<CR>

" Cursor in command line
cmap <C-f> <Right>
cmap <C-b> <Left>

" paste
nnoremap gp :<C-u>r !pbpaste<CR>

" delete highlight
nnoremap <silent> gh :let @/=''<CR>

" Git Blame
nnoremap <silent> gb :<C-u>Gblame<CR>

" Golang
noremap <silent> ;t :!go test .<CR>
noremap <silent> ;r :!go run %<CR>

" break undo chain when using insert mode deletions (:h i_CTRL-G_u)
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

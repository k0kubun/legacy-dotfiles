" some basic bindings

" Esc
noremap <C-e> <Esc>
noremap <C-E> <Esc>
inoremap <C-e> <Esc>
inoremap <C-E> <Esc>
cnoremap <C-e> <Esc>
cnoremap <C-E> <Esc>

" スクロール
noremap <Space>j <C-f>
noremap <Space>k <C-b>

" ウィンドウ切り替え
nnoremap [Tag] <Nop>
nmap <Space> [Tag]
nnoremap [Tag]h <C-w>h
nnoremap [Tag]l <C-w>l

" Explore
nnoremap <silent> ;e :<C-u>Explore<CR>

" End Vim
nnoremap <silent> ;xc :qa!<CR>

" delete highlight
nnoremap <silent> gh :let @/=''<CR>

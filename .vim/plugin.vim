" neocomplecache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"

" Unite.vim
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_limit = 20

" Unbind <C-e> in unite
augroup test
  autocmd!
  autocmd FileType unite inoremap <buffer> <C-e> <Esc>
augroup END

" vim-markdown
let g:vim_markdown_initial_foldlevel=2

" vim-tags
let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R {OPTIONS} `bundle show --paths` 2>/dev/null"

" vim-gitgutter
let g:gitgutter_sign_column_always = 1

" gocode
set rtp+=$GOROOT/misc/vim
let g:go_fmt_autofmt = 1

" golint
exe "set rtp+=" . globpath($GOPATH, "src/github.com/golang/lint/misc/vim")

" coq-syntax
au BufRead,BufNewFile *.v set filetype=coq

" disable trailing whitespace highlight in unite
" autocmd FileType unite autocmd! BufWinEnter * match
" autocmd FileType unite autocmd! InsertLeave * match
" autocmd FileType unite autocmd! InsertEnter * match
" autocmd BufLeave unite autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd BufLeave unite autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufLeave unite autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

" Airline
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_inactive_collapse=1
" let g:airline_theme='powerlineish'
" let g:airline#extensions#tabline#tab_nr_type = 1
" let g:airline#extensions#tabline#show_buffers = 0

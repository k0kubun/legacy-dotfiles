if exists('b:did_indent')
  finish
endif

setlocal nocindent
setlocal nolisp
setlocal autoindent
setlocal indentexpr=GetSchemeIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,:,.

setlocal expandtab
setlocal tabstop<
setlocal softtabstop=2
setlocal shiftwidth=2

let b:undo_indent = 'setlocal '.join([
\   'nocindent<',
\   'nolisp<',
\   'autoindent<',
\   'expandtab<',
\   'indentexpr<',
\   'indentkeys<',
\   'shiftwidth<',
\   'softtabstop<',
\   'tabstop<',
\ ])

function! GetSchemeIndent()
  let indentCount = GetOpenParenthesisCount() - GetCloseParenthesisCount()
  return indent(prevnonblank(v:lnum - 1)) + indentCount * &l:shiftwidth
endfunction

function! GetCharCount(text, char)
  let cnt = 0
  for i in range(0, strlen(a:text) - 1)
    if a:text[i] == a:char
      let cnt += 1
    endif
  endfor
  return cnt
endfunction

function! GetOpenParenthesisCount()
  let prevLine = getline(prevnonblank(v:lnum - 1))
  let currentLine = getline(v:lnum)
  return GetCharCount(prevLine, "(") + GetCharCount(currentLine, "(")
endfunction

function! GetCloseParenthesisCount()
  let prevLine = getline(prevnonblank(v:lnum - 1))
  let currentLine = getline(v:lnum)
  return GetCharCount(prevLine, ")") + GetCharCount(currentLine, ")")
endfunction

let b:did_indent = 1

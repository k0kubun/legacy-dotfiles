# git branch
alias -g B='`git branch | peco | sed -e "s/^\*[ ]*//g"`'

if ! which peco > /dev/null; then
  return
fi

# history
function peco-select-history() {
  typeset tac
  if which tac > /dev/null; then
    tac=tac
  else
    tac='tail -r'
  fi
  BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle -R -c
}
zle -N peco-select-history
bindkey '^r' peco-select-history

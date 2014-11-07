# language
export LANG=ja_JP.UTF-8

# auto cd by dir name
# setopt auto_cd

# auto pushd
setopt auto_pushd
setopt pushd_ignore_dups

# share zsh history
setopt share_history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000

# don't logout by EOF
setopt ignore_eof

export PATH="/opt/local/bin:$PATH"
export EDITOR="vim"

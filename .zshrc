# zsh prompt
PROMPT='%m:%c %n%# '

# ls
alias ls="ls -Gla"
alias lsorg="/bin/ls"

# rspec
alias spec="rspec -c"
alias rspecdoc='rake spec SPEC_OPTS="--format documentation"'

# Vim
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# Run tmux automatically
if [ -z "$TMUX" -a -z "$STY" ]; then
    if type tmuxx >/dev/null 2>&1; then
        tmuxx
    elif type tmux >/dev/null 2>&1; then
        if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
            tmux attach && echo "tmux attached session "
        else
            tmux new-session && echo "tmux created new session"
        fi
    elif type screen >/dev/null 2>&1; then
        screen -rx || screen -D -RR
    fi
fi

# Configuration for git
alias g="git"
alias ga="git commit -am"
alias gm="git commit -m"
alias gp="git push"

function gc(){
    git clone https://github.com/$1/$2
}

function readd() {
    git add . # must add first because it will raise error if there are unstaged files
    git rm . -r --cached
    git add .
}

# Android SDK
export PATH="/Applications/android-sdk-macosx/tools:$PATH"
export PATH="/Applications/android-sdk-macosx/platform-tools:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

function gem(){
    $HOME/.rbenv/shims/gem $*
    if [ "$1" = "install" ] || [ "$1" = "i" ] || [ "$1" = "uninstall" ] || [ "$1" = "uni" ]
    then
        rbenv rehash
        rehash
    fi
}

# bundler
alias be="bundle exec"

# function for grep
function find-grep(){
    find . -name \*.$1 -exec grep -nH $2 {} \;
}

# TeX
export PATH="/usr/texbin:$PATH"
function ttp() {
    platex $1
    dvipdfmx $1
    rm *.dvi
    rm *.log
    rm *.aux
}

# Xcode
alias cleanx="rm -rf ~/Library/Developer/Xcode/DerivedData/"

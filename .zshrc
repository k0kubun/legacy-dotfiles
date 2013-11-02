# zsh prompt
PROMPT='%F{cyan}%(5~,%-2~/.../%2~,%~)%f (∩’ᴗ’)⊇ '
autoload -Uz vcs_info
precmd() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

# ls
alias ls="ls -Gla"

# rspec
alias spec="rspec -c"
alias rspecdoc='rake spec SPEC_OPTS="--format documentation"'

# tmux
export PATH="$HOME/bin:$PATH"
alias tmux="tmux -2"
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
alias gs="git status"
alias gd="git diff"
alias ga="git commit -am"
alias gp="git push"
alias gg="git grep -n"
alias gh="git branch"
alias go="git checkout"

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

function md2pdf() {
    gimli -f $1
}

# PostgreSQL
export PGDATA=/usr/local/var/postgres

# load local settings
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# rails
alias -g RET="RAILS_ENV=test"
alias -g RED="RAILS_ENV=development"
alias -g REP="RAILS_ENV=production"

# rake
alias raket='RAILS_ENV=test rake'
alias raked='RAILS_ENV=development rake'
alias rakep='RAILS_ENV=production rake'

# Screen Lock
alias l='"/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession" -suspend'

# hash rocket
function hr() {
    sed -i '' -e 's/:\([a-zA-Z_]*\) =>/\1:/g' $1
}

# ctags
alias ctags="/usr/local/bin/ctags"
alias rtags="/usr/local/bin/ctags -R .; /usr/local/bin/ctags -R `bundle show --paths`"

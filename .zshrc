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
alias gs="git status"
alias gd="git diff"
alias ga="git commit -am"
alias gh="git branch"
alias co="git checkout"
alias gus="git branch | percol | xargs git checkout"
alias ghs="git branch | percol | xargs git branch -D"
function gl(){
  if [ $# -ne 0 ]; then
    git log --date=iso --pretty=format:'%h %Cgreen%ad %Cblue%cn %Creset%s %C(blue)%d%Creset' $@
  else
    git log --date=iso --pretty=format:'%h %Cgreen%ad %Cblue%cn %Creset%s %C(blue)%d%Creset' -10
  fi
}
function gp(){
  if [ $# -ne 0 ]; then
    git push $@ `git rev-parse --abbrev-ref HEAD`
  else
    git push
  fi
}
function gg() {
  if [ -e .git ]; then
    git grep -n $@
  else
    find . -type f | xargs grep -n --color=auto $@
  fi
}
alias titech="git config --global http.proxy 131.112.125.238:3128"
alias untitech="git config --global --unset http.proxy"

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
alias b="bundle install"
alias be="bundle exec"
export BUNDLE_JOBS=4

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
alias lock='"/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession" -suspend'

# hash rocket
function hr() {
  sed -i '' -e 's/:\([a-zA-Z_]*\) =>/\1:/g' $1
}

# ctags
alias ctags="/usr/local/bin/ctags"

# git-hook
export PATH="$HOME/.git-hook/bin:$PATH"

# vim
alias vi="/usr/local/bin/vim"
alias vim="/usr/local/bin/vim"

# .zshrc reload
alias re="source ~/.zshrc"

# zsh-context-sensitive-alias
source ~/.zsh/bundle/zsh-context-sensitive-alias/csa.zsh
csa_init

function my_context_func {
  local -a ctx
  if [[ -n `git rev-parse --git-dir 2> /dev/null` ]]; then
    ctx+=git
  fi
  if [[ -e Gemfile ]]; then
    ctx+=bundler
  fi
  csa_set_context $ctx
}
typeset -ga chpwd_functions
chpwd_functions+=my_context_func

csalias bundler rails 'bundle exec rails'
csalias bundler rake 'bundle exec rake'
csalias bundler rspec 'bundle exec rspec'

# golang
export GOPATH=${HOME}/go
export PATH="${GOPATH}/bin:$PATH"
export GOROOT="/usr/local/Cellar/go/1.2.1/libexec"
alias g="/usr/local/bin/go"
alias gor="/usr/local/bin/go run"

# misc
function lines(){
  if [ $# -ne 0 ]; then
		sum=0
		for source in `find . -type f -name "*.$@"`
		do
			lines=`wc -l $source | sed -e "s/ [^ ]*$//" | sed -e "s/ //g"`
			sum=`expr $lines + $sum`
			printf "%6d $source\n" $lines
		done
		echo "Total: $sum"
  else
		echo "Usage: lines [extension]"
  fi
}

# override command in $GOPATH/bin for development
function goverride {
  local override_path
	local original_command_path
	local load_path

	override_path="$GOPATH/bin/$1"
	original_command_path="$override_path.goverride"

  if [ $# -eq 2 ]; then
		load_path=$2

		if [ ! -e $original_command_path ]; then
			cp $override_path $original_command_path
		fi
		if [ -e $override_path ]; then
			rm $override_path
		fi

		echo "#!/bin/sh" > $override_path
		echo "go run \`find $load_path -type f -name \"*.go\"\` \$@" >> $override_path
		chmod 755 $override_path

		echo "Installed overrided $1"

	elif [ $# -eq 1 ]; then
		if [ -e $original_command_path ]; then
			cp -f $original_command_path $override_path
			echo "Uninstalled overrided $1"
		else
			echo ".goverride file does not exist"
		fi
	else
		echo "Usage:"
		echo "  Install:"
		echo "    goverride [command] [local_path]"
		echo "  Uninstall:"
		echo "    goverride [command]"
  fi
}

# Scheme
alias gosh="gosh-rl"

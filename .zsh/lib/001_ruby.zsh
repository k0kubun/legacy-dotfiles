# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# Currently "rbenv init" is disabled because it is very slow
# eval "$(rbenv init -)"
alias bundle='eval "$(rbenv init -)"; unalias bundle; bundle'
alias ri='eval "$(rbenv init -)"'
alias dotremap='eval "$(rbenv init -)"; unalias dotremap; dotremap'

# auto rehash when gem install
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

# parallel bundle install
export BUNDLE_JOBS=4

# rails
alias -g RET="RAILS_ENV=test"
alias -g RED="RAILS_ENV=development"
alias -g REP="RAILS_ENV=production"

# hash rocket
function hr() {
	sed -i '' -e 's/:\([a-zA-Z_]*\) =>/\1:/g' $1
}

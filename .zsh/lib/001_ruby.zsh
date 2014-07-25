# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# Currently "rbenv init" is disabled because it is very slow
# eval "$(rbenv init -)"
alias bundle='eval "$(rbenv init -)"; unalias bundle; bundle'

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

# bundle exec auto alias
csalias bundler rails 'bundle exec rails'
csalias bundler rake 'bundle exec rake'
csalias bundler rspec 'bundle exec rspec'
csalias bundler cap 'bundle exec cap'

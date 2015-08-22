# Load local settings first
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

function load() {
	lib="${HOME}/.zsh/lib/${1}.zsh"
	source $lib
}

load go
if which rbenv > /dev/null; then
	load ruby
fi
load aliases
load basic
if which -a tmux | grep -q bin; then
	load tmux
fi
load completion
load functions
load overrides
load git
load languages
load peco
load theme
load csa

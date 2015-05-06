# Load local settings first
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

function load() {
	lib="${HOME}/.zsh/lib/${1}.zsh"
	source $lib
}

load go
load ruby
load aliases
load basic
load tmux
load completion
load functions
load git
load languages
load peco
load theme
load csa

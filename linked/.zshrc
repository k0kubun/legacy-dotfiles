# Load local settings first
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

LOAD_LIBS="
  go
	ruby
	aliases
	basic
	tmux
	completion
	functions
	git
	languages
	peco
	theme
	csa
"

while read line; do
	if [[ $line == "" ]]; then
		continue
	fi

	lib="${HOME}/.zsh/lib/${line}.zsh"
	source $lib
done <<< "${LOAD_LIBS}"

# Python
export PATH="$HOME/.pyenv/bin:$PATH"
# Disable pyenv because "pyenv init" is very slow
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Scheme
alias gosh="gosh-rl"

# TeX
export PATH="/usr/texbin:$PATH"
function ttp() {
	platex $1
	dvipdfmx $1
	rm *.dvi
	rm *.log
	rm *.aux
}

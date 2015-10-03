# Python
export PATH="$HOME/.pyenv/bin:$PATH"
# Disable pyenv because "pyenv init" is very slow
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Scheme
alias gosh="gosh-rl"

# TeX
export PATH="$PATH:/usr/texbin"
function tex() {
	platex $1
	dvipdfmx $1
	rm *.dvi
	rm *.log
	rm *.aux
}

# Haskell
export PATH=$HOME/.cabal/bin:$PATH
alias ce="cabal exec"

# C
export CC=/usr/local/opt/apple-gcc42/bin/gcc-4.2
export CXX=/usr/local/opt/apple-gcc42/bin/g++-4.2
export CPP=/usr/local/opt/apple-gcc42/bin/cpp-4.2

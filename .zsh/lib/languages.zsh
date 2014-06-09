# Python
export PATH="$HOME/.pyenv/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

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

# Go
export GOPATH=${HOME}/go
export PATH="${GOPATH}/bin:$PATH"
export GOROOT="/usr/local/opt/go/libexec"
alias g="/usr/local/bin/go"
alias gor="/usr/local/bin/go run"

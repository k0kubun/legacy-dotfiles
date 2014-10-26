#!/usr/bin/env bash

# Install brew
if ! which brew > /dev/null; then
  install_script_url=https://raw.githubusercontent.com/Homebrew/install/master/install
  ruby -e "$(curl -fsSL $install_script_url)"
fi

BREW_PACKAGES="
  go
  openssl
  rbenv
  reattach-to-user-namespace
  ruby-build
  tmux
  vim --with-lua --with-luajit

  peco/peco/peco
  caskroom/cask/brew-cask
"

while read line; do
  if [[ $line != "" ]]; then
    package=$(echo $line | cut -d' ' -f1)
    package_name=$(basename ${package})

    if brew list -1 | grep "^${package_name}" > /dev/null; then
      echo "Skip: brew install ${line}"
    else
      brew cask install ${line}
    fi
  fi
done <<< "${BREW_PACKAGES}"

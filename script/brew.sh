#!/usr/bin/env bash

# Install brew
if ! which brew > /dev/null; then
  install_script_url=https://raw.githubusercontent.com/Homebrew/install/master/install
  ruby -e "$(curl -fsSL $install_script_url)"
fi

PACKAGES="
  go
  tmux
  rbenv
  ruby-build
  reattach-to-user-namespace
  openssl

  peco/peco/peco
  caskroom/cask/brew-cask
"

for package in $PACKAGES; do
  package_name=$(basename ${package})

  if brew list -1 | grep "^${package_name}" > /dev/null; then
    echo "Skip: brew install ${package}"
  else
    brew install $package
  fi
done

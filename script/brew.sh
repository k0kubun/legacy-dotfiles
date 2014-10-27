#!/usr/bin/env bash

# Install brew
if ! which -s brew; then
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

brew_list=$(brew list -1)

while read line; do
  if [[ $line != "" ]]; then
    package=$(echo $line | cut -d' ' -f1)
    package_name=$(basename ${package})

    if echo "${brew_list}" | grep -q "^${package_name}"; then
      echo "Skip: brew install ${line}"
    else
      brew install ${line}
    fi
  fi
done <<< "${BREW_PACKAGES}"

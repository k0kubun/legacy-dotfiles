#!/usr/bin/env bash

# Install brew
if ! which -s brew; then
  install_script_url=https://raw.githubusercontent.com/Homebrew/install/master/install
  ruby -e "$(curl -fsSL $install_script_url)"
fi

BREW_PACKAGES="
  cabal-install
  ctags
  docker
  ghc
  ghostscript
  git
  go --with-cc-common
  hub
  imagemagick
  mercurial
  mysql
  openssl
  peco
  phantomjs
  plantuml
  postgres
  rbenv
  rbenv-default-gems
  rbenv-gem-rehash
  readline
  reattach-to-user-namespace
  redis
  ruby-build --HEAD
  the_silver_searcher
  tmux
  vim --with-lua --with-luajit

  caskroom/cask/brew-cask
  k0kubun/envchain/envchain
  motemen/ghq/ghq
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

#!/usr/bin/env bash

CASK_PACKAGES="
  alfred
  atom
  caffeine
  dockertoolbox
  dropbox
  google-chrome
  google-japanese-ime
  iterm2
  karabiner
  licecap
  seil
  sequel-pro
  vagrant
  virtualbox
"
INSTALL_OPTIONS="--appdir=/Applications"

cask_list=$(brew cask list -1)

for package in $CASK_PACKAGES; do
  if echo "${cask_list}" | grep -q "^${package}"; then
    echo "Skip: brew cask install ${package}"
  else
    HOMEBREW_CASK_OPTS="${INSTALL_OPTIONS}" brew cask install $package
  fi
done

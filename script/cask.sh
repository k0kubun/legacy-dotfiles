#!/usr/bin/env bash

CASK_PACKAGES="
  alfred
  atom
  caffeine
  dropbox
  google-chrome
  google-japanese-ime
  iterm2
  karabiner
  licecap
  sequel-pro
  vagrant
  virtualbox

  aereal/homebrew-aereal_casks/aquaskk
"
INSTALL_OPTIONS="--appdir=/Applications"

cask_list=$(brew cask list -1)

for package in $CASK_PACKAGES; do
  package_name=$(basename ${package})

  if echo "${cask_list}" | grep -q "^${package_name}"; then
    echo "Skip: brew cask install ${package}"
  else
    HOMEBREW_CASK_OPTS="${INSTALL_OPTIONS}" brew cask install $package
  fi
done

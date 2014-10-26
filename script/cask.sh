#!/usr/bin/env bash

CASK_PACKAGES="
  alfred
  caffeine
  google-chrome
  google-japanese-ime
  iterm2
  karabiner
  yorufukurou
"
INSTALL_OPTIONS="--appdir=/Applications"

for package in $CASK_PACKAGES; do
  if brew cask list -1 | grep "^${package}" > /dev/null; then
    echo "Skip: brew cask install ${package}"
  else
    HOMEBREW_CASK_OPTS="${INSTALL_OPTIONS}" brew cask install $package
  fi
done

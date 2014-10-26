#!/usr/bin/env bash

if ! which brew > /dev/null; then
  install_script_url=https://raw.githubusercontent.com/Homebrew/install/master/install
  ruby -e "$(curl -fsSL $install_script_url)"
fi

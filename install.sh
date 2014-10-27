#!/usr/bin/env bash

repo_path=~/src/github.com/k0kubun/dotfiles

rebuild k0kubun/dotfiles -f -s script -d $repo_path <<-PRIMARY
  brew.sh
  cask.sh
  ruby.sh
  symlink.sh
  karabiner.sh
PRIMARY

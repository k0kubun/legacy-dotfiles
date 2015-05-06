#!/usr/bin/env bash

user=k0kubun
repo=dotfiles
workdir=~/src/github.com/${user}/${repo}

# Clone repository
if [ ! -e $workdir ]; then
  mkdir -p ~/src/github.com/${user}
  git clone https://github.com/${user}/${repo} $workdir
fi
pushd $workdir > /dev/null

# Install homebrew
if ! which -s brew; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Bundle install
which bundle > /dev/null || sudo gem install bundler
bundle install > /dev/null

# Run serverkit
bundle exec serverkit apply recipe.yml
if [ $? -ne 0 ]; then
  popd > /dev/null
  exit 1
else
  popd > /dev/null
fi

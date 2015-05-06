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
sudo which bundle > /dev/null || sudo gem install bundler
bundle install > /dev/null

# Run serverkit
bundle exec serverkit apply recipe.yml --log-level=DEBUG
popd > /dev/null

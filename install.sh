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

# Bundle install
sudo which bundle > /dev/null || sudo gem install bundler
sudo bundle install > /dev/null

# Run serverkit
sudo bundle exec serverkit apply recipe.yml
popd > /dev/null

#!/usr/bin/env bash

user=k0kubun
repo=dotfiles
branch=master

tempdir=/tmp
archive=${tempdir}/${repo}.zip
workdir=${tempdir}/${repo}-${branch}

# Fetch repository to /tmp/dotfiles-master
if [ ! -e $workdir ]; then
  echo -n "Fetching dotfiles repository..."
  curl -Ls -o $archive https://github.com/${user}/${repo}/archive/${branch}.zip
  unzip -o $archive -d $tempdir > /dev/null
  rm $archive
  echo " done."
fi

# Require password only once
read -s -p "Password:" password
echo

# Ensure bundler availability
if ! which bundle > /dev/null; then
  if which ruby | grep -q rbenv; then
    gem install bundler
  else
    # For system ruby
    echo $password | sudo -s gem install bundler
  fi
fi

# Execute bootstrap script
pushd $workdir > /dev/null
echo $password | sudo -s bundle install
SUDO_PASSWORD=$password bundle exec itamae local -l debug bootstrap.rb
popd > /dev/null
rm -rf $workdir

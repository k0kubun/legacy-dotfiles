#!/usr/bin/env bash

user=k0kubun
repo=dotfiles
branch=master

tempdir=/tmp
archive=${tempdir}/${repo}.zip
workdir=${tempdir}/${repo}-${branch}

if [ ! -e $workdir ]; then
  # Fetch repository to /tmp/dotfiles-master
  echo -n "Fetching dotfiles repository..."
  curl -L -o $archive https://github.com/${user}/${repo}/archive/${branch}.zip 2> /dev/null
  unzip -o $archive -d $tempdir > /dev/null
  rm $archive
  echo " done."
fi

# Update repository
echo "Updating repository..."
pushd $workdir > /dev/null

# Cleanup
popd > /dev/null
echo "Finished to install dotfiles."

#!/usr/bin/env bash

user=k0kubun
repo=dotfiles
branch=master

tempdir=/tmp
archive=${tempdir}/${repo}.zip
unzipped=${tempdir}/${repo}-${branch}

# Fetch repository to /tmp/dotfiles-master
echo "Fetching dotfiles repository..."
curl -L -o $archive https://github.com/${user}/${repo}/archive/${branch}.zip 2> /dev/null
rm -rf $unzipped
unzip -o $archive -d $tempdir > /dev/null

# Run installer
echo "Running installer..."
pushd $unzipped > /dev/null
# WIP

# Cleanup
popd > /dev/null
rm $archive
echo "Finished to install dotfiles."

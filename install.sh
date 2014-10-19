#!/usr/bin/env bash

user=k0kubun
repo=dotfiles
branch=master

tempdir=/tmp
archive=${tempdir}/${repo}.zip
unzipped=${tempdir}/${repo}-${branch}

# Fetch repository to /tmp/dotfiles-master
curl -L -o $archive https://github.com/${user}/${repo}/archive/${branch}.zip
unzip -o $archive -d $tempdir

# Run installer
pushd $unzipped
# WIP

# Cleanup
popd
rm $archive

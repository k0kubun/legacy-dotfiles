#!/usr/bin/env bash

repository_root=$(cd $(dirname $0); cd ..; pwd)
linked_dir=${repository_root}/linked
link_destination=$HOME

force_symlink() {
  target=$1
  from=${linked_dir}/${target}
  to=${HOME}/${target}

  rm -rf $to
  ln -s $from $to
  echo "Link: ${target} -> ${to}"
}

for linked in `\ls -A ${linked_dir}`; do
  force_symlink $linked
done
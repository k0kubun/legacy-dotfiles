#!/usr/bin/env bash

repository_root=$(cd $(dirname $0); cd ..; pwd)
source_dir=${repository_root}/bin
copy_destination=${HOME}/bin

force_copy() {
  target=$1
  from=${source_dir}/${target}
  to=${copy_destination}/${target}

  rm -f $to
  cp $from $to
  echo "Copy: ${target} -> ${to}"
}

for copied in `\ls ${source_dir}`; do
  force_copy $copied
done

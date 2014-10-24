#!/bin/sh

# expand path of this script
script_absolute_path=$(cd $(dirname $0); pwd)

# Usage:
# $ update_alias .vimrc
update_alias() {
  # requred argument: alias target file/dir name
  file_name=$1

  # alias path initialization
  if [ $# -eq 2 ]; then
    src_name=$2
    alias_source_path=$script_absolute_path"/"$src_name
  else
    alias_source_path=$script_absolute_path"/"$file_name
  fi
  alias_destination_path=$HOME"/"$file_name

  # check alias source
  if [ ! -e $alias_source_path ]; then
    echo "Alias source not found: "$alias_source_path
    return 1
  fi

  # remove existing file at destination path
  if [ -e $alias_destination_path ] || [ -L $alias_destination_path ]; then
    echo "\nDeleted existing file: "$alias_destination_path
    rm -rf $alias_destination_path
  fi

  # create symlink
  ln -s $alias_source_path $alias_destination_path
  if [ $? -eq 0 ]; then
    echo "Successfully created symlink: "\
      $alias_source_path" -> "$alias_destination_path
  fi
}

# update alias for files whose filename start with '.'
for dotfile in `ls -A | grep "^\."`
do
  # skip .git, .gitconfig and .gitmodules
  echo $dotfile | grep -q "^\.\(git\|gitmodules\|remap\\.rb\)\$"
  [ $? -eq 0 ] && continue

  echo $dotfile
  update_alias $dotfile
done

update_alias .remap .remap.rb

# if ! which dotremap > /dev/null; then
#   sudo gem install dotremap
#
#   if ! which dotremap > /dev/null; then
#     echo "failed to install dotremap"
#     return
#   fi
# fi
#
# dotremap

#!/usr/bin/env bash

repository_root=$(cd $(dirname $0); cd ..; pwd)
linked_dir=${repository_root}/linked
link_destination=$HOME

pushd $repository_root > /dev/null
git submodule init
git submodule update
popd > /dev/null

force_symlink() {
  target=$1
  from=${linked_dir}/${target}
  to=${link_destination}/${target}

  log_symlink $from $to
}

log_symlink() {
  real_path=$1
  virtual_path=$2
  target=$(basename $realpath)

  rm -rf $virtual_path
  ln -s $real_path $virtual_path
  echo "Link: ${target} -> ${virtual_path}"
}

# Do not symlink shallow directory
DEEP_SYMLINKS="
  .rbenv/default-gems
  .config/fontconfig
"

IGNORED="
  .tmux.conf
  fonts.conf
"

# Symlink ~/
for linked in `\ls -A ${linked_dir}`; do
  if echo $DEEP_SYMLINKS | grep $linked -q; then
    continue
  fi
  if echo $IGNORED | grep $linked -q; then
    continue
  fi
  force_symlink $linked
done

# Symlink ~/.*/
for linked in $DEEP_SYMLINKS; do
  force_symlink $linked
done

# Symlink .tmux.conf
case $(uname) in
  "Darwin" )
    log_symlink ~/src/github.com/k0kubun/dotfiles/linked/.tmux.conf.darwin ~/.tmux.conf
    ;;
  * )
    force_symlink .tmux.conf
    ;;
esac

# Symlink ~/bin
linked_dir=${repository_root}/bin
link_destination=${HOME}/bin
mkdir -p ${HOME}/bin
for linked in `\ls ${linked_dir}`; do
  force_symlink $linked
done

# Etc
touch ~/.tmux.conf.local
if [ ! -e ~/icloud ]; then
  ln -s -f ~/Library/Mobile\ Documents/com\~apple\~CloudDocs ~/icloud
fi

# initialize .git-template
if [ ! -e ~/.git-template/hooks ]; then
	ln -s ~/.githooks ~/.git-template/hooks
fi

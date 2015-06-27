#!/usr/bin/env bash

VERSION="2.2.0"
INSTALL_OPTIONS="
  --with-readline-dir=$(brew --prefix readline)
  --with-openssl-dir=$(brew --prefix openssl)
"
DEFAULT_GEMS="
  bundler
  rake
  rebuild
"

if rbenv versions | grep -q $VERSION; then
  echo "Skip: rbenv install ${VERSION}"
else
  RUBY_CONFIGURE_OPTS="${INSTALL_OPTIONS}" rbenv install ${VERSION}
  rbenv global $VERSION
fi

rbenv_init=$(rbenv init -)
eval "${rbenv_init}"

gem_list=$(gem list)

for gem_name in $DEFAULT_GEMS; do
  if echo "${gem_list}" | grep -q $gem_name; then
    echo "Skip: gem install ${gem_name}"
  else
    gem install $gem_name
    rbenv rehash
  fi
done

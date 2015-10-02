#!/usr/bin/env bash

VERSION="2.2.3"
INSTALL_OPTIONS="
  --with-readline-dir=$(brew --prefix readline)
  --with-openssl-dir=$(brew --prefix openssl)
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

#!/usr/bin/env bash

version="2.1.2"

install_options="
  --with-readline-dir=$(brew --prefix readline)
  --with-openssl-dir=$(brew --prefix openssl)
"

if rbenv versions | grep -v $version > /dev/null; then
  RUBY_CONFIGURE_OPTS="${install_options}" rbenv install ${version}
fi

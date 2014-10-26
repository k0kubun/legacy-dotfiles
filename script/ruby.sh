#!/usr/bin/env bash

version="2.1.2"

if rbenv versions | grep -v $version > /dev/null; then
  sh <<-EOS
    RUBY_CONFIGURE_OPTS="
      --with-readline-dir=$(brew --prefix readline)
      --with-openssl-dir=$(brew --prefix openssl)
    "
    rbenv install ${version}
  EOS
fi

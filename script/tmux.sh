#!/usr/bin/env bash

if [ ! -f ~/Library/Monaco\ for\ Powerline.otf ]; then
  git clone https://gist.github.com/1838072.git /tmp/monaco-for-powerline
  mv /tmp/monaco-for-powerline/Monaco\ for\ Powerline.otf ~/Library/Fonts
  rm -rf /tmp/monaco-for-powerline
fi

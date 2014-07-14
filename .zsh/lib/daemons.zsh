if ! which dotremap > /dev/null; then
  echo "Installing dotremap..."
  gem install dotremap

  if ! which dotremap > /dev/null; then
    echo "failed to install dotremap"
    return
  fi
fi


if ! which autobuild > /dev/null; then
  echo "Installing autobuild..."
  go get -u github.com/k0kubun/autobuild

  if ! which autobuild > /dev/null; then
    echo "failed to install autobuild"
    return
  fi
fi

if ! pgrep -f autobuild_dotremap > /dev/null; then
  echo "Launched dotremap autobuild daemon"
  nohup autobuild "dotremap" -f ~/.remap -i autobuild_dotremap > /dev/null &
fi

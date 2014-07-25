TIMEFUNC=0
LIB_DEBUG=0

if [ $LIB_DEBUG -ne 0 ]; then
  TIMEFUNC=1
fi

if [ $TIMEFUNC -ne 0 ]; then
  function microsec() {
    perl -e 'use Time::HiRes qw(gettimeofday); my($sec,$microsec)=gettimeofday(); $curdate=localtime($sec); print $microsec . "\n";'
  }

  function start() {
    START_TIME=`microsec`
  }

  function finish() {
    END_TIME=`microsec`

    TIME=`expr ${END_TIME} - ${START_TIME}`
    SEC=`expr $TIME / 1000000`
    MIC=`expr $TIME % 1000000`
    echo "${SEC}.`printf '%06d' $MIC`: $1"
  }
fi

# Load local settings first
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Load splitted configs
for file in `/bin/ls -F ~/.zsh/lib/*`
do
  if [ $LIB_DEBUG -ne 0 ]; then
    start
    source $file
    finish $file
  else
    source $file
  fi
done

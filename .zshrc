TIMEFUNC=0
LIB_DEBUG=0

if ! which go > /dev/null; then
	TIMEFUNC=0
	LIB_DEBUG=0
fi

if [ $LIB_DEBUG -ne 0 ]; then
	TIMEFUNC=1
fi

if [ $TIMEFUNC -ne 0 ]; then
	if ! [ -e /tmp/unixnano ] > /dev/null; then
		<<-EOS > /tmp/unixnano.go
			package main

			import (
				"fmt"
				"time"
			)

			func main() {
				fmt.Println(time.Now().UnixNano())
			}
		EOS
		go build -o /tmp/unixnano /tmp/unixnano.go
	fi

	function start() {
		START_TIME=`/tmp/unixnano`
	}

	function finish() {
		END_TIME=`/tmp/unixnano`

		TIME=`expr ${END_TIME} - ${START_TIME}`
		SEC=`expr $TIME / 1000000000`
		USEC=`expr $TIME % 1000000000`
		echo "${SEC}.`printf '%09d' $USEC`: $1"
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

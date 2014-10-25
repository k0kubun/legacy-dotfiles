ENABLE_TIMEFUNC=0
LIB_DEBUG=0

source ~/.zsh/debugger.zsh

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

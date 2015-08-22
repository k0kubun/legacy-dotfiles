# Load local settings first
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

case $(uname) in
	Linux )
		source ~/.zshrc.linux
		;;
	Darwin )
		source ~/.zshrc.darwin
		;;
	* )
		echo "Unknown uname $(uname)"
		;;
esac

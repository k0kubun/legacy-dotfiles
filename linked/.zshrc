case $(uname) in
	Linux )
		source ~/.zshrc.linux
		;;
	Darwin )
		source ~/.zshrc.darwin
		;;
	* )
		echo "Unknown uname $(uname)"
esac

# function for grep
function find-grep(){
  find . -name \*.$1 -exec grep -nH $2 {} \;
}

# misc
function lines(){
  if [ $# -ne 0 ]; then
		sum=0
		for source in `find . -type f -name "*.$@"`
		do
			lines=`wc -l $source | sed -e "s/ [^ ]*$//" | sed -e "s/ //g"`
			sum=`expr $lines + $sum`
			printf "%6d $source\n" $lines
		done
		echo "Total: $sum"
  else
		echo "Usage: lines [extension]"
  fi
}

# markdown to pdf
function md2pdf() {
  gimli -f $1
}

# override command in $GOPATH/bin for development
function goverride {
  local override_path
	local original_command_path
	local load_path

	override_path="$GOPATH/bin/$1"
	original_command_path="$override_path.goverride"

  if [ $# -eq 2 ]; then
		load_path=$2

		if [ ! -e $original_command_path ]; then
			cp $override_path $original_command_path
		fi
		if [ -e $override_path ]; then
			rm $override_path
		fi

		echo "#!/bin/sh" > $override_path
		echo "go run \`find $load_path -type f -name \"*.go\"\` \$@" >> $override_path
		chmod 755 $override_path

		echo "Installed overrided $1"

	elif [ $# -eq 1 ]; then
		if [ -e $original_command_path ]; then
			cp -f $original_command_path $override_path
			echo "Uninstalled overrided $1"
		else
			echo ".goverride file does not exist"
		fi
	else
		echo "Usage:"
		echo "  Install:"
		echo "    goverride [command] [local_path]"
		echo "  Uninstall:"
		echo "    goverride [command]"
  fi
}

# command history analyzer
function analyze() {
  cat ~/.zsh_history | awk 'BEGIN {FS=";"} {print $2}' | awk '{print $1}' | sort | uniq -c | sort -nr | head
}

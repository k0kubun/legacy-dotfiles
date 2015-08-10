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
		echo "	Install:"
		echo "		goverride [command] [local_path]"
		echo "	Uninstall:"
		echo "		goverride [command]"
	fi
}

# command history analyzer
function analyze() {
	cat ~/.zsh_history | awk 'BEGIN {FS=";"} {print $2}' | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 15
}

# replace foo bar #=> s/foo/bar/
function replace() {
	gg --name-only $1 | xargs sed -i "" -e "s/$1/$2/g"
}

function kill-applespell() {
  if [ -e /System/Library/Services/AppleSpell.service/Contents/Resources ]; then
		sudo mv /System/Library/Services/AppleSpell.service/Contents/Resources{,.disabled}
	fi
	pkill AppleSpell
}

function pass() {
	if [ $# -ne 0 ]; then
		envchain $@ env | grep SUDO_PASSWORD | sed -e "s/SUDO_PASSWORD=//" | tr -d "\n" | pbcopy
	else
		echo "Usage: pass NAMESPACE"
	fi
}

function replace-githooks() {
	if [ -e .git/hooks ]; then
		rm -rf .git/hooks
	fi
	ln -s ~/.githooks .git/hooks
	mkdir -p .git/local_hooks
}

function replace-all() {
	for repo in `ghq list`; do
		pushd "${GOPATH}/src/${repo}" > /dev/null
		replace-githooks
		source .git/hooks/ctags &
		popd > /dev/null
	done
}

functions tags-update() {
	source ~/.githooks/ctags
}
alias t="tags-update"

function u() {
	src=$(\ls | grep \.uml)
	png=$(echo $src | sed 's/\.uml/\.png/')

	java -jar /usr/local/opt/plantuml/plantuml.8018.jar -tpng $src
}

function uml() {
	src=$(\ls | grep \.uml)
	png=$(echo $src | sed 's/\.uml/\.png/')

	java -jar /usr/local/opt/plantuml/plantuml.8018.jar -tpng $src
	open $png
}

function private() {
	git config --local user.email takashikkbn@gmail.com
	git config --local user.name "Takashi Kokubun"
}

function git-summary() {
	echo
	git status
	git diff
	zle redisplay
}
zle -N git-summary
bindkey '^g' git-summary

# ghe get
function ghe() {
	case $1 in
		get )
			# You must export $GHE_HOST in ~/.zshrc.local
			ghq get $GHE_HOST:$2
			;;
		* )
			ghq $@
			;;
	esac
}

export GHQ=/usr/local/bin/ghq

function ghq() {
	case $1 in
		get )
			$GHQ $@

			# hook after ghq get
			(ghq-cache refresh &)
			;;
		list )
			if [ ! -e ~/.ghq-cache ]; then
				ghq-cache refresh
			fi

			# use ghq list ordered by ghq-cache
			cat ~/.ghq-cache
			;;
		* )
			$GHQ $@
			;;
	esac
}

function bundle-default() {
	for version in $(rbenv-versions); do
		rbenv local $version
		for gem in $(cat ~/.rbenv/default-gems); do
			gems=`gem list`
			if echo $gems | grep -q $gem; then
				echo "Skip ${version}: ${gem}"
			else
				gem install $gem
				echo "Install ${version}: ${gem}"
			fi
		done
	done
	rm .ruby-version
}

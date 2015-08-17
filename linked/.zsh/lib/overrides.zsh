# monkey command extensions

export GHQ="/usr/local/bin/ghq"
function ghq() {
	case $1 in
		get )
			repo=$2

			# always clone with ssh scheme
			$GHQ get $repo -p

			# hook after ghq get
			(ghq-cache refresh &)

			matched=`$GHQ list | grep "${repo}$"`
			if [ $matched != "" ]; then
				repo_dir="${GOPATH}/src/${matched}"
				pushd $repo_dir > /dev/null
				private
				popd > /dev/null
			fi
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

export GIT="/usr/local/bin/git"
function git() {
	case $1 in
		init )
			$GIT $@
			(ghq-cache refresh &)
			;;
		clone )
			$GIT $@
			(ghq-cache refresh &)
			;;
		* )
			$GIT $@
			;;
	esac
}

function bundle() {
	super=$(which -a bundle | tail -n1)

	case $1 in
		cd )
			cd `$super show $2`
			;;
		* )
			$super $@
			;;
	esac
}

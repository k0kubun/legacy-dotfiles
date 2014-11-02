# Configuration for git
alias gs="git status"
alias gd="git diff"
alias ga="git commit -am"
alias gh="git branch"
alias co="git checkout"
alias origin="git pull origin master"
alias amend="git commit --amend"
alias ch='git rev-parse HEAD | sed -e "s/\(.\{7\}\).*/\1/" | tr -d "\n" | pbcopy'
alias empty="git commit --allow-empty -m"

alias current-branch='git rev-parse --abbrev-ref HEAD'

function gl(){
	if [ $# -ne 0 ]; then
		git log --date=iso --pretty=format:'%h %Cgreen%ad %Cblue%cn %Creset%s %C(blue)%d%Creset' $@
	else
		git log --date=iso --pretty=format:'%h %Cgreen%ad %Cblue%cn %Creset%s %C(blue)%d%Creset' -10
	fi
}

# git push to current branch with remote fallback
function gp() {
	if [ $# -ne 0 ]; then
		# if origin is http://github.com/foo/bar, change to github.com:foo/bar
		if git remote | grep -q origin; then
			remote=`git config --get remote.origin.url`

			if echo $remote | grep -q "^https://"; then
				new_remote=`echo $remote | sed -e "s/https:\/\/github\.com\//github.com:/g"`

				git remote rm origin
				git remote add origin $new_remote
			fi
		fi

		# check whether remote mine exists or not
		mine_push=false
		for arg in $@; do
			if [ $arg = "mine" ]; then
				mine_push=true
			fi
		done

		# if mine does not exist, push to origin
		if $mine_push; then
			if git remote | grep -q mine; then
				git push $@ `current-branch`
			else
				git push `echo $@ | sed -e "s/mine/origin/"` `current-branch`
			fi
		else
			git push $@ `current-branch`
		fi
	else
		git push
	fi
}

function gg() {
	if [[ -n `git rev-parse --git-dir 2> /dev/null` ]]; then
		git grep -n $@
	else
		find . -type f | xargs grep -n --color=auto $@
	fi
}

function up() {
	git branch --set-upstream-to=$@/master master
}

function mine() {
	if [[ -n `git remote | grep mine` ]]; then
		echo "remote mine is already set up"
		return
	fi

	local repo_name=$(git rev-parse --show-toplevel | sed -e "s/^.*\///g")
	local repo_path="github.com:k0kubun/${repo_name}"
	git remote add mine $repo_path
	git fetch mine
	git branch --set-upstream-to=mine/`current-branch` `current-branch`
	echo "added remote mine: ${repo_name}"
}

# Apply proxy for titech pubnet
alias titech="git config --global http.proxy 131.112.125.238:3128"
alias untitech="git config --global --unset http.proxy"

# git-hook
export PATH="$HOME/.git-hook/bin:$PATH"

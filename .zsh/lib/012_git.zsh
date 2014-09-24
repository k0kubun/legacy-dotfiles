# Configuration for git
alias gs="git status"
alias gd="git diff"
alias ga="git commit -am"
alias gh="git branch"
alias co="git checkout"
alias gus="git branch | percol | xargs git checkout"
alias ghs="git branch | percol | xargs git branch -D"
alias origin="git pull origin master"
alias amend="git commit --amend"
alias ch='git rev-parse HEAD | sed -e "s/\(.\{7\}\).*/\1/" | tr -d "\n" | pbcopy'

alias current-branch='git rev-parse --abbrev-ref HEAD'

function gl(){
	if [ $# -ne 0 ]; then
		git log --date=iso --pretty=format:'%h %Cgreen%ad %Cblue%cn %Creset%s %C(blue)%d%Creset' $@
	else
		git log --date=iso --pretty=format:'%h %Cgreen%ad %Cblue%cn %Creset%s %C(blue)%d%Creset' -10
	fi
}

function gp(){
	if [ $# -ne 0 ]; then
		git push $@ `current-branch`
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

# alias
alias ..="cd .."
alias ls="ls -la --color"
alias be="bundle exec"
alias re="source ~/.zshrc"
alias gs="git status"
alias gd="git diff"
alias ga="git commit -am"
alias gh="git branch"
alias co="git checkout"
alias dsl="karabiner dsl"
alias amend="git commit --amend"
alias suspend="xset dpms force suspend"
alias -g B='`git branch | peco | sed -e "s/^\*[ ]*//g"`'
function vi() { vim ${=*/:/ +} }
function bundle-cd() { cd `bundle show $1` }

# env
export LANG=ja_JP.UTF-8
export GOPATH=$HOME
export PATH="${GOPATH}/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/bin:${PATH}" # Use brew's vim

# ruby
eval "$(rbenv init - --no-rehash zsh)"

# zsh
setopt auto_pushd
setopt pushd_ignore_dups
setopt share_history
setopt ignore_eof
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000

# tmux
alias tmux="tmux -2"
if [ -z "$TMUX" -a -z "$STY" ]; then
	if type tmux > /dev/null 2>&1; then
		tmux new-session -A -s "*scratch*"
	fi
fi
function create-session() {
	if [ $# -ne 0 ]; then
		target_dir=$1
	else
		target_dir='.'
	fi
	target_dir=$(cd $target_dir; pwd)
	session_name=$(echo $target_dir | grep -o "[^/]*/[^/]*$" | sed -e "s/\./,/g")

	# switch or create session
	if tmux has-session -t $session_name > /dev/null 2>&1; then
		tmux switch-client -t $session_name
		return
	fi
	TMUX= tmux new-session -d -s $session_name -c $target_dir -n editor
	tmux switch-client -t $session_name

	# I usually work on 4 windows
	tmux send-keys -t $session_name "tmux new-window -d" C-m
	tmux send-keys -t $session_name "tmux new-window -d" C-m
	tmux send-keys -t $session_name "tmux new-window -d" C-m

	tmux send-keys -t $session_name "clear" C-m
	tmux send-keys -t $session_name "tmux send-keys -t editor 'vi .' C-m" C-m
	# tmux send-keys -t $session_name "tmux send-keys -t editor ':vs' C-m" C-m
}
alias cs="create-session"

# completion
autoload -U compinit
compinit
setopt auto_param_slash
setopt mark_dirs
autoload colors
colors
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# peco
function peco-select-history() {
	typeset tac
	if which tac > /dev/null; then
		tac=tac
	else
		tac='tail -r'
	fi
	BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER" --prompt "[zsh history]")
	CURSOR=$#BUFFER
	zle redisplay
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function peco-src() {
	local selected_dir=$(ghq list | peco --query "$LBUFFER" --prompt "[ghq list]")
	if [ -n "$selected_dir" ]; then
		full_dir="${GOPATH}/src/${selected_dir}"

		# Log repository access to ghq-cache
		silent-nohup ghq-cache log $full_dir

		BUFFER="cd ${full_dir}"
		zle accept-line
	fi
	zle redisplay
}
zle -N peco-src
stty -ixon
bindkey '^s' peco-src

function peco-find-file() {
	if git rev-parse 2> /dev/null; then
		source_files=$(git ls-files)
	else
		source_files=$(find . -type f)
	fi
	selected_files=$(echo $source_files | peco --prompt "[find file]")

	result=''
	for file in $selected_files; do
		result="${result}$(echo $file | tr '\n' ' ')"
	done

	BUFFER="${BUFFER}${result}"
	CURSOR=$#BUFFER
	zle redisplay
}
zle -N peco-find-file
bindkey '^q' peco-find-file

# zsh prompt
PROMPT='%F{cyan}%(5~,%-2~/.../%2~,%~)%f $ '
autoload -Uz vcs_info
precmd() {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

# git
alias current-branch='git rev-parse --abbrev-ref HEAD'

function gl(){
	if [ $# -ne 0 ]; then
		git log --date=iso --pretty=format:'%h %Cgreen%ad %Cblue%cn %Creset%s %C(blue)%d%Creset' $@
	else
		git log --date=iso --pretty=format:'%h %Cgreen%ad %Cblue%cn %Creset%s %C(blue)%d%Creset' -10
	fi
}

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

function github-url() {
	ruby <<-EOS
		require 'uri'

		def parse_remote(remote_origin)
		  if remote_origin =~ /^(https|ssh):\/\//
		    uri = URI.parse(remote_origin)
		    [uri.host, uri.path]
		  elsif remote_origin =~ /^[^:\/]+:\/?[^:\/]+\/[^:\/]+$/
		    host, path = remote_origin.split(":")
		    [host.split("@").last, path]
		  else
		    raise "Not supported origin url: #{remote_origin}"
		  end
		end

		host, path = parse_remote(\`git config remote.origin.url\`.strip)
		puts "https://#{host}/#{path.gsub(/\.git$/, '')}"
	EOS
}

function preq() {
	# git rev-list --ancestry-path : only display commits that exist directly on the ancestry chain
	# git rev-list --first-parent  : follow only the first parent commit upon seeing a merge commit
	merge_commit=$(ruby -e 'print (File.readlines(ARGV[0]) & File.readlines(ARGV[1])).last' <(git rev-list --ancestry-path $1..master) <(git rev-list --first-parent $1..master))

	if git show $merge_commit | grep -q 'pull request'; then
		issue_number=$(git show $merge_commit | grep 'pull request' | ruby -ne 'puts $_.match(/#(\d+)/)[1]')
		url="$(github-url)/pull/${issue_number}"
	else
		url="$(github-url)/commit/${1}"
	fi

	open $url
}

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

function private() {
	git config --local user.email takashikkbn@gmail.com
	git config --local user.name "Takashi Kokubun"
}

# Environment-local configurations
[ -f ~/.zshrc.local ]   && source ~/.zshrc.local
[ -f ~/.zshrc.`uname` ] && source ~/.zshrc.`uname`

# tmux
export PATH="$HOME/bin:$PATH"
alias tmux="tmux -2"
if [ -z "$TMUX" -a -z "$STY" ]; then
	if type tmuxx >/dev/null 2>&1; then
		tmuxx
	elif type tmux >/dev/null 2>&1; then
		if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
			tmux attach && echo "tmux attached session "
		else
			tmux new-session && echo "tmux created new session"
		fi
	elif type screen >/dev/null 2>&1; then
		screen -rx || screen -D -RR
	fi
fi

function rails-session() {
  if [ $# -ne 0 ]; then
		target_dir=$1
	else
		target_dir='.'
	fi
	session_name=$(cd $target_dir; pwd | sed -e "s/^.*\///g")

	# initialize session and open 'server' window
	if tmux has-session -t $session_name > /dev/null 2>&1; then
		tmux kill-session -t $session_name
	fi
	TMUX= tmux new-session -d -s $session_name -n server -c $target_dir
	tmux switch-client -t $session_name

	# pending
}

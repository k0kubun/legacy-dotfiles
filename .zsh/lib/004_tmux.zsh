# tmux
export PATH="$HOME/bin:$PATH"
alias tmux="tmux -2"
if [ -z "$TMUX" -a -z "$STY" ]; then
	if type tmux > /dev/null 2>&1; then
		tmux new-session -A -s "scratch"
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

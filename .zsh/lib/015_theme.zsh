# zsh prompt
PROMPT='%F{cyan}%(5~,%-2~/.../%2~,%~)%f (∩’ᴗ’)⊇ '
autoload -Uz vcs_info
precmd() {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

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

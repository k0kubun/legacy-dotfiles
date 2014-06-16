# use completion
autoload -U compinit
compinit

# select completion by cursor
zstyle ':completion:*:default' menu select=2

# --opt=*** completion
setopt magic_equal_subst

# complete / of dir name
setopt auto_param_slash
setopt mark_dirs

# colorize completions
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# group completions
zstyle ':completion:*' group-name ''

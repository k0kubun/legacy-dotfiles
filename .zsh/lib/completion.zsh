# use completion
autoload -Uz compinit
compinit

# --opt=*** completion
setopt magic_equal_subst

# complete / of dir name
setopt auto_param_slash

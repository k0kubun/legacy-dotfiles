# Load local settings first
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Load splitted configs
for file in `/bin/ls -F ~/.zsh/lib/*`
do
  source $file
done

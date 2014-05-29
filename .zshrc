# Load splitted configs
for file in `ls -F ~/.zsh/lib/*`
do
  source $file
done

# Load local settings
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# TODO: replace this to ghq
DOTFILES_DIR = "/tmp/dotfiles"
config_dir = File.join(DOTFILES_DIR, "config")

git DOTFILES_DIR do
  repository "https://github.com/k0kubun/dotfiles"
end

# TODO: fix bug
# link "/Users/k0kubun/.tmux.conf" do
#   to File.join(config_dir, ".tmux.conf")
# end

# TODO: fix bug
# remote_file "/Users/k0kubun/.tmux.conf" do
#   source "../config/.tmux.conf"
# end

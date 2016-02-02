node.reverse_merge!(
  dotfiles_directory: ENV['HOME'],
)

link File.join(node[:dotfiles_directory], '.tmux.conf.local') do
  to config_path.join(".tmux.conf.#{node[:platform]}").to_s
  force true
end

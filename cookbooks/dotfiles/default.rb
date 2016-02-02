node.reverse_merge!(
  dotfiles_directory: ENV['HOME'],
)

node[:dotfiles].each do |file|
  link File.join(node[:dotfiles_directory], file) do
    to config_path.join(file).to_s
    force true
  end
end

node.reverse_merge!(
  dotfiles_directory: ENV['HOME'],
)

node[:dotfiles].each do |file|
  link File.join(node[:dotfiles_directory], file) do
    to File.expand_path(File.join('../../../', file), __dir__)
    force true
  end
end

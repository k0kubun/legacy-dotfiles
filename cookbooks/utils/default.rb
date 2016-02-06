require 'pathname'

node.reverse_merge!(
  utils_directory: ENV['HOME'],
)

bin_dir = Pathname.new(node[:utils_directory]).join('bin')
directory bin_dir.to_s

files_dir = Pathname.new(File.expand_path('./files', __dir__))
Dir.glob(files_dir.join('*').to_s).each do |path|
  command = File.basename(path)
  link bin_dir.join(command).to_s do
    to files_dir.join(command).to_s
    force true
  end
end

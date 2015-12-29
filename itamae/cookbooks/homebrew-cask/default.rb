require 'itamae/plugin/resource/cask'

node.reverse_merge!(
  cask_packages: [],
)

node[:cask_packages].each do |name|
  cask name
end

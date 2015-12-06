node.reverse_merge!(
  brew_packages: [],
)

execute "install homebrew" do
  install_script_url = "https://raw.githubusercontent.com/Homebrew/install/master/install"

  not_if "which brew"
  command %Q[ruby -e $(curl -fsSL #{install_script_url})]
end

# Faster than package resource
define :brew, options: nil do
  package = params[:name]
  options = params[:options]

  execute "brew install #{package}" do
    command "brew install #{package} #{options}"
    not_if "ls -1 $(brew --prefix)/Cellar/ | grep '^#{File.basename(package)}$'"
  end
end

node[:brew_packages].each do |arg|
  name, opts = arg.split(' ', 2)
  brew name do
    options opts
  end
end

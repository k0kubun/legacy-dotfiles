BREW_INSTALLER = "https://raw.githubusercontent.com/Homebrew/install/master/install"

INSTALL_PACKAGES = %[
  go
  tmux
  mysql
  rbenv
  ruby-build
  reattach-to-user-namespace
]

execute %Q[ruby -e "$(curl -fsSL #{BREW_INSTALLER})"] do
  not_if "which brew"
end

INSTALL_PACKAGES.each do |pkg|
  package pkg
end

package "vim" do
  options "--with-lua --with-luajit"
end

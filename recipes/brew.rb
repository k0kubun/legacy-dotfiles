BREW_PACKAGES = %w[
  go
  tmux
  rbenv
  ruby-build
  reattach-to-user-namespace

  peco/peco/peco
]

BREW_INSTALLER = "https://raw.githubusercontent.com/Homebrew/install/master/install"
execute "install homebrew" do
  command %Q[ruby -e "$(curl -fsSL #{BREW_INSTALLER})"]
  not_if "which brew"
end

BREW_PACKAGES.each do |pkg|
  package pkg
end

package "vim" do
  options "--with-lua --with-luajit"
end

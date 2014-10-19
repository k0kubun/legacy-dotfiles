BREW_INSTALLER = "https://raw.githubusercontent.com/Homebrew/install/master/install"

execute %Q[ruby -e "$(curl -fsSL #{BREW_INSTALLER})"] do
  not_if "which brew"
end

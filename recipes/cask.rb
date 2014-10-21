CASK_PACKAGES = %w[
  alfred
  caffeine
  google-chrome
  google-japanese-ime
  iterm2
  karabiner
  yorufukurou
]

package "caskroom/cask/brew-cask"

cask "link" do
  action :alfred
end

CASK_PACKAGES.each do |pkg|
  cask pkg
end

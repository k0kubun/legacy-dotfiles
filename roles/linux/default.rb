include_recipe 'yaourt'
include_recipe 'background'
include_recipe 'xmonad_screenshot'
include_cookbook 'tmux-conf'
include_cookbook 'utils'

execute 'HiDPI' do
  command 'gsettings set org.gnome.desktop.interface scaling-factor 2'
  not_if 'gsettings get org.gnome.desktop.interface scaling-factor | grep "^uint32 2$"'
end

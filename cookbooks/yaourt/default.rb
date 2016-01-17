remote_file '/etc/pacman.conf' do
  notifies :run, 'execute[pacman -Syy]'
end

execute 'pacman -Syy' do
  not_if 'pacman -Q yaourt'
end

package 'yaourt'

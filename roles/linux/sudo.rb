include_cookbook 'yaourt'
include_cookbook 'dotfiles'
include_cookbook 'ruby'

include_recipe 'pacman'

user 'k0kubun' do
  shell '/bin/zsh'
end

service 'mysqld' do
  action [:start, :enable]
end

remote_file '/usr/lib/urxvt/perl/clipboard'
remote_file '/usr/share/X11/xorg.conf.d/11-composite.conf'

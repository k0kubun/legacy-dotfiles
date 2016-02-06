include_recipe 'rbenv::user'
execute 'chown -R k0kubun:wheel /home/k0kubun/.rbenv' do
  only_if 'stat -c "%U" /home/k0kubun/.rbenv | grep root'
end

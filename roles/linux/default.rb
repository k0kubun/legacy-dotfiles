define :yaourt do
  package = params[:name]
  execute "yaourt -S --noconfirm #{package}" do
    not_if "yaourt -Q #{package}"
  end
end

include_cookbook 'dotfiles'

yaourt 'ttf-inconsolata'

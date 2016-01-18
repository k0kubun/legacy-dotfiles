define :yaourt do
  package = params[:name]
  execute "yaourt -S --noconfirm #{package}" do
    not_if "yaourt -Q #{package}"
  end
end

yaourt 'google-chrome'

yaourt 'gtk-theme-arc'

yaourt 'ttf-inconsolata'
yaourt 'ttf-migu'
yaourt 'adobe-source-sans-pro-fonts'

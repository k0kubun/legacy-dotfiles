define :yaourt do
  package = params[:name]
  execute "yaourt -S --noconfirm #{package}" do
    not_if "yaourt -Q #{package}"
  end
end

include_recipe 'background'
include_recipe 'rbenv::user'

# desktop apps
yaourt 'google-chrome'

# input method
yaourt 'ibus'
yaourt 'ibus-qt'
yaourt 'ibus-skk'
yaourt 'skk-jisyo'

# utils
yaourt 'feh'
yaourt 'gtk-theme-arc'
yaourt 'htop'
yaourt 'trayer'
yaourt 'unrar'

# fonts
yaourt 'ttf-inconsolata'
yaourt 'ttf-migu'
yaourt 'adobe-source-sans-pro-fonts'

# development
yaourt 'nodejs'
yaourt 'npm'

define :yaourt do
  package = params[:name]
  execute "yaourt -S --noconfirm #{package}" do
    not_if "yaourt -Q #{package}"
  end
end

# desktop apps
yaourt 'google-chrome'

# input method
yaourt 'ibus-skk'
yaourt 'skk-jisyo'

# gtk
yaourt 'gtk-theme-arc'

# fonts
yaourt 'ttf-inconsolata'
yaourt 'ttf-migu'
yaourt 'adobe-source-sans-pro-fonts'

# wallpaper
yaourt 'feh'

# extra
yaourt 'htop'
yaourt 'unrar'

# X: IV
# Copyright (C) 2014-2016 Slurpaza
# http://slurpaza.deviantart.com/art/X-IV-492416104
remote_file '/home/k0kubun/.background.jpg'

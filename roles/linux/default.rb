define :yaourt do
  package = params[:name]
  execute "yaourt -S --noconfirm #{package}" do
    not_if "yaourt -Q #{package}"
  end
end

# desktop apps
yaourt 'google-chrome'

# wallpaper
yaourt 'feh'

# gtk
yaourt 'gtk-theme-arc'

# fonts
yaourt 'ttf-inconsolata'
yaourt 'ttf-migu'
yaourt 'adobe-source-sans-pro-fonts'

# extra
package 'unrar'

# X: IV
# Copyright (C) 2014-2016 Slurpaza
# http://slurpaza.deviantart.com/art/X-IV-492416104
remote_file '/home/k0kubun/.background.jpg'

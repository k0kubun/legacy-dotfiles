define :yaourt do
  package = params[:name]
  execute "yaourt -S --noconfirm #{package}" do
    not_if "yaourt -Q #{package} || yaourt -Qg #{package}"
  end
end

# desktop apps
yaourt 'google-chrome'

# input method
yaourt 'ibus'
yaourt 'ibus-skk'
yaourt 'skk-jisyo'

# X utils
yaourt 'xclip'
yaourt 'xsel'

# utils
yaourt 'bind-tools'
yaourt 'compton'
yaourt 'graphviz'
yaourt 'gtk-theme-arc'
yaourt 'htop'
yaourt 'mirage'
yaourt 'time'
yaourt 'tmux'
yaourt 'trayer'
yaourt 'unrar'
yaourt 'vim'
yaourt 'wget'
yaourt 'xdot'
yaourt 'gnome-shell-frippery'
yaourt 'gnome-shell-extension-dash-to-dock'

# fonts
yaourt 'ttf-inconsolata'
yaourt 'ttf-migu'
yaourt 'adobe-source-sans-pro-fonts'

# development
yaourt 'mysql56'
yaourt 'nodejs'
yaourt 'npm'
yaourt 'phantomjs'
yaourt 'imagemagick'

# build deps
yaourt 'svn'
yaourt 'texinfo'
yaourt 'python'
yaourt 'perl'
yaourt 'm4'

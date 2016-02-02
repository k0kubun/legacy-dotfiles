yaourt 'cabal-install'

execute 'cabal update && cabal install alex' \
  ' && cabal install happy && cabal install gtk2hs-buildtools' \
  ' && cabal install xmonad-screenshot' do
  # FIXME: check xmonad-screenshot installation
  not_if 'which gtk2hsC2hs'
end

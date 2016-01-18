include_cookbook 'yaourt'
include_cookbook 'dotfiles'

# fundamentals
package 'sudo'
package 'openssh'

# until itamae execution
package 'gcc'
package 'git'
package 'make'
package 'ruby'

# X window system
package 'xorg-server'
package 'xorg-xinit'
package 'xorg-xmodmap'
package 'xf86-video-intel'

# xmonad
package 'xmonad'
package 'xmonad-contrib'
package 'dmenu'
package 'xmobar'

# terminal
package 'xterm'
package 'rxvt-unicode'

# build deps
package 'autoconf'
package 'automake'
package 'pkg-config'
package 'fakeroot'

# extra
package 'go'
package 'unzip'
package 'vim'
package 'zip'
package 'zsh'

user 'k0kubun' do
  shell '/bin/zsh'
end

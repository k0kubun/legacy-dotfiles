include_cookbook 'yaourt'
include_cookbook 'dotfiles'
include_cookbook 'ruby'

# fundamentals
package 'sudo'
package 'openssh'

# until itamae execution
package 'gcc'
package 'git'
package 'make'

# X window system
package 'xorg-server'
package 'xorg-server-utils'
package 'xorg-xinit'
package 'xorg-xmodmap'
package 'xf86-video-intel'

# sound
package 'alsa-utils'

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
package 'fakeroot'
package 'patch'
package 'pkg-config'

# extra
package 'go'
package 'unzip'
package 'zip'
package 'zsh'

user 'k0kubun' do
  shell '/bin/zsh'
end

service 'mysqld' do
  action [:start, :enable]
end

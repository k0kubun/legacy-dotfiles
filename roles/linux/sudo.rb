include_cookbook 'yaourt'
include_cookbook 'dotfiles'

package 'xorg-server'
package 'xorg-xinit'
package 'xf86-video-intel'

package 'xmonad'
package 'xmonad-contrib'
package 'dmenu'
package 'xmobar'

package 'xterm'
package 'rxvt-unicode'

package 'sudo'
package 'git'
package 'ruby'
package 'go'
package 'make'
package 'openssh'
package 'zip'
package 'unzip'
package 'fakeroot'

package 'vim'
package 'zsh'

# passwd k0kubun
user 'k0kubun' do
  shell '/bin/zsh'
end

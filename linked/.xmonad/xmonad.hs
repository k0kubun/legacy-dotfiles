import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
  xmproc <- spawnPipe "xmobar ~/.xmonad/xmobarrc"
  xmonad $ defaults
    { manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ layoutHook defaultConfig
    , startupHook = startup
    }

defaults = defaultConfig
  { terminal = "urxvt"
  , borderWidth = 2
  , focusedBorderColor = "cyan"
  }

startup = do
  spawn "feh --bg-fill ~/Pictures/grisaia.jpg"

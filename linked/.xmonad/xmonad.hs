import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

import qualified XMonad.StackSet as W
import qualified Data.Map as M

main = do
  xmproc <- spawnPipe "xmobar ~/.xmonad/xmobarrc"
  xmonad $ defaults
    { manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ layoutHook defaultConfig
    , startupHook = startup
    }

defaults = defaultConfig
  { terminal = "urxvt"
  , keys = myKeys
  , borderWidth = 2
  , focusedBorderColor = "cyan"
  }

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
  [ ((modm, xK_Return), spawn $ XMonad.terminal conf)
  -- close focused window
  , ((modm .|. shiftMask, xK_c), kill)
   -- Rotate through the available layout algorithms
  , ((modm, xK_space ), sendMessage NextLayout)
  --  Reset the layouts on the current workspace to default
  , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
  -- Resize viewed windows to the correct size
  , ((modm, xK_n), refresh)
  -- Move focus to the next window
  , ((modm, xK_Tab), windows W.focusDown)
  -- Move focus to the next window
  , ((modm, xK_j), windows W.focusDown)
  -- Move focus to the previous window
  , ((modm, xK_k), windows W.focusUp  )
  -- Swap the focused window and the master window
  , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)
  -- Swap the focused window with the next window
  , ((modm .|. shiftMask, xK_j), windows W.swapDown  )
  -- Swap the focused window with the previous window
  , ((modm .|. shiftMask, xK_k), windows W.swapUp    )
  -- Shrink the master area
  , ((modm, xK_h), sendMessage Shrink)
  -- Expand the master area
  , ((modm, xK_l), sendMessage Expand)
  -- Push window back into tiling
  , ((modm, xK_t), withFocused $ windows . W.sink)
  , ((modm .|. shiftMask, xK_t), withFocused $ \w -> floatLocation w >>= windows . W.float w . snd)
  -- Increment the number of windows in the master area
  , ((modm, xK_comma ), sendMessage (IncMasterN 1))
  -- Deincrement the number of windows in the master area
  , ((modm, xK_period), sendMessage (IncMasterN (-1)))
  ]

startup = do
  spawn "feh --bg-fill ~/Pictures/bg.jpg"

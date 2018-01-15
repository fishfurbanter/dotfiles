import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName

import XMonad.Util.Run        (spawnPipe)
import XMonad.Util.EZConfig   (additionalKeys)
import XMonad.Util.SpawnOnce

import Data.List
import qualified XMonad.StackSet as W

import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.WindowArranger
import XMonad.Layout.NoBorders
import XMonad.Layout.Fullscreen
import XMonad.Layout.Circle
import XMonad.Layout.Dishes
import XMonad.Layout.Gaps

import XMonad.Actions.CycleWS (prevWS, nextWS)

import System.IO


-- namd options ----------------------------------------------------------------
-- colours
normBord = "#343C48"
focdBord = "#6986a0"
fore     = "#DEE3E0"
back     = "#282c34"
winType  = "#c678dd"

-- programs
rofi = "rofi -show run"
-----------

myWorkspaces    :: [String]
myWorkspaces    = click $ [
                            " Personal "
                           ," Study "
                           ," Linux "
                           ," Dev "
                           ," Manage "
                           ," SSH "
                           ," IDE "
--                           ," IDE ^i(/home/andecy/devicons-master/svg/git_branch.xbm) "
                          ]
                  where click l = [ "^ca(1, xdotool key super+"
                                  ++ show (n) ++ ")" ++ ws ++ "^ca()" |
                                  (i,ws) <- zip [1..] l,
                                  let n = i]

myManageHook = composeAll
    [ className =? "Firefox"   --> doF(W.shift(myWorkspaces !! 2))
    , className =? "Evince"  --> doFloat
    , className =? "transmission-qt"  --> doFloat
    , className =? "transmission"  --> doFloat
    , className =? "Gimp"      --> doFloat
    ]

-- keys
mKeys = [ ((modMask, xK_d), spawn $ rofi)
        , ((modMask, xK_f), spawn $ "firefox" )
        , ((modMask, xK_Left), prevWS)
        , ((modMask, xK_Right), nextWS)
        , ((modMask                 .|. shiftMask, xK_z    ), spawn "slock"                 )
        , ((modMask .|. controlMask              , xK_s    ), sendMessage  Arrange          )
        , ((modMask .|. controlMask .|. shiftMask, xK_s    ), sendMessage  DeArrange        )
        , ((modMask .|. controlMask              , xK_Left ), sendMessage (MoveLeft      10))
        , ((modMask .|. controlMask              , xK_Right), sendMessage (MoveRight     10))
        , ((modMask .|. controlMask              , xK_Down ), sendMessage (MoveDown      10))
        , ((modMask .|. controlMask              , xK_Up   ), sendMessage (MoveUp        10))
        , ((modMask                 .|. shiftMask, xK_Left ), sendMessage (IncreaseLeft  10))
        , ((modMask                 .|. shiftMask, xK_Right), sendMessage (IncreaseRight 10))
        , ((modMask                 .|. shiftMask, xK_Down ), sendMessage (IncreaseDown  10))
        , ((modMask                 .|. shiftMask, xK_Up   ), sendMessage (IncreaseUp    10))
        , ((modMask .|. controlMask .|. shiftMask, xK_Left ), sendMessage (DecreaseLeft  10))
        , ((modMask .|. controlMask .|. shiftMask, xK_Right), sendMessage (DecreaseRight 10))
        , ((modMask .|. controlMask .|. shiftMask, xK_Down ), sendMessage (DecreaseDown  10))
        , ((modMask .|. controlMask .|. shiftMask, xK_Up   ), sendMessage (DecreaseUp    10))
        , ((modMask, xK_KP_Add), sequence_ [ sendMessage (IncreaseLeft 10)
                    , sendMessage (IncreaseRight 10)
                    , sendMessage (IncreaseUp 10)
                    , sendMessage (IncreaseDown 10)
                    ])
        , ((modMask, xK_KP_Subtract), sequence_ [ sendMessage (DecreaseLeft 10)
                         , sendMessage (DecreaseRight 10)
                         , sendMessage (DecreaseUp 10)
                         , sendMessage (DecreaseDown 10)
                         ])
        ] where modMask = myModMask

startUp :: X()
startUp = do
    spawnOnce "compton"
    spawnOnce "feh --bg-scale ~/.wallpapers/arch.jpg"
    spawnOnce "conky -c ~/.conky/bottom.conky | dzen2 -y 1056 -w 1920 -h 24 -e 'button2=;'"
    setWMName "LG3D"

logbar h = do
    dynamicLogWithPP $ tryPP h

tryPP :: Handle -> PP
tryPP h = def
    { ppOutput             = hPutStrLn h
    , ppCurrent            = dzenColor (fore) (normBord) . pad
    , ppVisible            = dzenColor (fore) (back) . pad
    , ppHidden             = dzenColor (fore) (back) . pad
    , ppHiddenNoWindows    = dzenColor (fore) (back) . pad
    , ppUrgent             = dzenColor (fore) (focdBord) . pad
    , ppOrder              = \(ws:l:t:_) -> [ws,l]
    , ppSep                = ""
    , ppLayout             = dzenColor (fore) (winType) .
                ( \t -> case t of
                    "Spacing 2 ResizableTall" -> " " ++ i ++ "tile.xbm) TALL "
                    "Full" -> " " ++ i ++ "dice1.xbm) FULL "
                    "Circle" -> " " ++ i ++ "dice2.xbm) CIRC "
                    _ -> " " ++ i ++ "tile.xbm) TALL "
                )
    } where i = "^i($HOME/.utils/icons/stlarch/"



-- layout --

res = ResizableTall 1 (2/100) (1/2) []
ful = noBorders (fullscreenFull Full)
dish = Dishes 1 (1/6)

-- useless gap --

layout = (gaps [(U, 40), (R, 8), (L, 8), (D, 32)] $
        avoidStruts (spacing 2 $ res)) ||| Circle ||| ful ||| dish
------------

myModMask = mod4Mask

main = do
    bar <- spawnPipe panel
    info <- spawnPipe "conky -c ~/.conky/top.conky |\
                      \dzen2 -x 400 -y 0 -h 30 -w 1520 -p -ta r -e 'button2=;'"
    xmonad $ def
        { manageHook = manageDocks <+> manageHook def
        , layoutHook = windowArrange layout
        , startupHook = startUp
        , workspaces = myWorkspaces
        , terminal = "urxvt"
        , borderWidth = 2
        , focusedBorderColor = focdBord
        , normalBorderColor = normBord
        , logHook = logbar bar
        , modMask = myModMask
        } `additionalKeys` mKeys
        where panel = "dzen2 -ta l -p -w 800 -y 0 -x 0 -h 30 -e 'button2=;'"



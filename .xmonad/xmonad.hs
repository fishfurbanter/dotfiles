import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName

import XMonad.Util.Run        (spawnPipe)
import XMonad.Util.EZConfig   (additionalKeys)
import XMonad.Util.SpawnOnce

import Data.List
import qualified XMonad.StackSet as W

import XMonad.Actions.WorkspaceNames
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

import XMonad.Hooks.EwmhDesktops (ewmh)
import qualified DBus as D
import qualified DBus.Client as D
import qualified Codec.Binary.UTF8.String as UTF8

-- namd options ----------------------------------------------------------------
-- colours
normBord = "#343C48"
focdBord = "#6986a0"
fore     = "#DEE3E0"
back     = "#282c34"
winType  = "#c678dd"



fg        = "#ebdbb2"
bg        = "#282828"
gray      = "#a89984"

bg1       = "#3c3836"
bg2       = "#6272a4"
red       = "#fb4934"

bg3       = "#665c54"
bg4       = "#7c6f64"

green     = "#b8bb26"
darkgreen = "#98971a"
darkred   = "#cc241d"
yellow    = "#fabd2f"
blue      = "#83a598"
purple    = "#d3869b"
aqua = "#8ec07c"




-- programs
rofi = "rofi -show run"
-----------

myWorkspaces    :: [String]
myWorkspaces    =  [
                            " Study "
                           ," Linux "
                           ," Dev "
                           ," Manage "
                           ," SSH "
                           ," Social "
--                           ," IDE ^i(/home/user/devicons-master/svg/git_branch.xbm) "
                          ]
--                  where click l = [ "^ca(1, xdotool key super+"
--                                  ++ show (n) ++ ")" ++ ws ++ "^ca()" |
--                                  (i,ws) <- zip [1..] l,
--                                  let n = i]

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
        , ((modMask .|. controlMask              , xK_m ), spawn $ "firefox -P manage" )
        , ((modMask .|. controlMask              , xK_n ), spawn $ "firefox -P social" )
        , ((modMask .|. controlMask              , xK_p ), spawn $ "firefox -P default" )
        , ((modMask .|. controlMask              , xK_l ), spawn $ "firefox -P study" )
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

--startUp :: X()
--startUp = do
--    spawn "polybar-restart"
--    spawnOnce "compton"
--    spawnOnce "feh --bg-scale ~/.wallpapers/arch.jpg"
--    spawnOnce "conky -c ~/.conky/bottom.conky | dzen2 -y 1056 -w 1920 -h 24 -e 'button2=;'"
--    setWMName "LG3D"

--logbar h = do
--    dynamicLogWithPP $ tryPP h

-- tryPP :: Handle -> PP
-- tryPP h = def
--     { ppOutput             = hPutStrLn h
--     , ppCurrent            = dzenColor (fore) (normBord) . pad
--     , ppVisible            = dzenColor (fore) (back) . pad
--     , ppHidden             = dzenColor (fore) (back) . pad
--     , ppHiddenNoWindows    = dzenColor (fore) (back) . pad
--     , ppUrgent             = dzenColor (fore) (focdBord) . pad
--     , ppOrder              = \(ws:l:t:_) -> [ws,l]
--     , ppSep                = ""
--     , ppLayout             = dzenColor (fore) (winType) .
--                 ( \t -> case t of
--                     "Spacing 2 ResizableTall" -> " " ++ i ++ "tile.xbm) TALL "
--                     "Full" -> " " ++ i ++ "dice1.xbm) FULL "
--                     "Circle" -> " " ++ i ++ "dice2.xbm) CIRC "
--                     _ -> " " ++ i ++ "tile.xbm) TALL "
--                 )
--     } where i = "^i($HOME/.utils/icons/stlarch/"
myLogHook :: D.Client -> PP
myLogHook dbus = def
    { ppOutput = dbusOutput dbus
    , ppCurrent = wrap ("%{B" ++ bg2 ++ "} ") " %{B-}"
    , ppVisible = wrap ("%{B" ++ bg1 ++ "} ") " %{B-}"
    , ppUrgent = wrap ("%{F" ++ red ++ "} ") " %{F-}"
    , ppHidden = wrap " " " "
    , ppWsSep = ""
    , ppSep = " : "
    , ppTitle = shorten 40
    , ppLayout = const ""
}
-- Emit a DBus signal on log updates
dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str = do
    let signal = (D.signal objectPath interfaceName memberName) {
            D.signalBody = [D.toVariant $ UTF8.decodeString str]
        }
    D.emit dbus signal
  where
    objectPath = D.objectPath_ "/org/xmonad/Log"
    interfaceName = D.interfaceName_ "org.xmonad.Log"
    memberName = D.memberName_ "Update"

-- layout --

res = ResizableTall 1 (2/100) (1/2) []
ful = noBorders (fullscreenFull Full)
dish = Dishes 1 (1/6)

-- useless gap --
--wsNameExtension = spawn $ "/home/andecy/dev/xmonad-ws-py/ff.py" ++ " " getCurrentWorkspaceName
myFunction = getCurrentWorkspaceName

layout = (gaps [(U, 40), (R, 8), (L, 8), (D, 32)] $
        avoidStruts (spacing 2 $ res)) ||| Circle ||| ful ||| dish
------------

myModMask = mod4Mask

main :: IO ()
main = do
    --bar <- spawnPipe panel
    --info <- spawnPipe "conky -c ~/.conky/top.conky |\
      --                \dzen2 -x 400 -y 0 -h 30 -w 1520 -p -ta r -e 'button2=;'"
    dbus <- D.connectSession
    -- Request access to the DBus name
    D.requestName dbus (D.busName_ "org.xmonad.Log")
        [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]
    
    xmonad . ewmh $ def
        { manageHook = manageDocks <+> manageHook def
        , layoutHook = windowArrange layout
        , startupHook =  spawn "polybar-restart"
        , workspaces = myWorkspaces
        , terminal = "urxvt"
        , borderWidth = 2
        , focusedBorderColor = focdBord
        , normalBorderColor = normBord
        , logHook = dynamicLogWithPP (myLogHook dbus)
        , modMask = myModMask
        } `additionalKeys` mKeys



# REVIEW42: This may expose your computer model, not sure
setxkbmap -model pc105 -layout us,il -option grp:shifts_toggle
xrdb -load .Xresources
#conky -c ~/.conky/bottom.conky | dzen2 -y 1056 -w 1920 -h 24 &
#exec qtile
feh --bg-scale ~/.wallpapers/*
xscreensaver -nosplash&
exec xmonad

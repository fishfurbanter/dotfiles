#!/bin/sh

MONITOR_COUNT=$(xrandr --query | grep ' connected ' | wc -l)

if [ "$MONITOR_COUNT" = "3" ]; then
        xrandr --output DVI-D-1 --off \
               --output DP-1 --mode 1920x1080 --pos 3840x0 --rotate normal \
               --output DP-2 --mode 1920x1080 --pos 0x0 --rotate normal \
               --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal \
               --output DP-3 --off
fi

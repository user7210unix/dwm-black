#!/bin/sh

# Set up monitors
xrandr --output DP-2-8 --auto --primary
xrandr --output DP-2-1 --auto --right-of DP-2-8

/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
slstatus &
picom &
~/.fehbg &
exec dwm


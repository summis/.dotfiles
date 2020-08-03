#!/bin/sh
# This layout is basic laptop's keyboard and display and
# it is just shared to HDMI output.

killall --quiet conky polybar

xrandr \
  --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
  --output DP1 --off \
  --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal \
  --output HDMI2 --off \
  --output VIRTUAL1 --off

# Can not mirror eDP1 bar due to https://github.com/polybar/polybar/issues/1323
# or similar. Can't see xbacklight module :(
polybar --quiet -r HDMI1 &
conky --quiet
random_wallpaper.sh
setxkbmap -layout fi -variant nodeadkeys

exit 0

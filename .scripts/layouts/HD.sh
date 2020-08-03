#!/bin/sh
# Basic configuration of laptop without external keyboards
# or monitors.

killall --quiet conky polybar

xrandr \
  --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
  --output DP1 --off \
  --output HDMI1 --off \
  --output HDMI2 --off \
  --output VIRTUAL1 --off

polybar --quiet -r eDP1 &
conky --quiet
random_wallpaper.sh
setxkbmap -layout fi -variant nodeadkeys

exit 0

#!/bin/sh
# This layout consist of only external UltraHD display and
# external (English layout) keyboard.

killall --quiet conky polybar

xrandr \
  --output eDP1 --off \
  --output DP1 --off \
  --output HDMI1 --primary --mode 2560x1440 --pos 0x0 --rotate normal \
  --output HDMI2 --off \
  --output VIRTUAL1 --off

polybar --quiet -r HDMI1 &
conky --quiet
random_wallpaper.sh
setxkbmap -layout us -variant intl

exit 0

#!/bin/sh
# This layout consist of laptop's own HD display,
# external UltraHD display that extends up HD display
# and external (English layout) keyboard.

killall --quiet conky polybar

xrandr \
  --output eDP1 --primary --mode 1920x1080 --pos 320x1440 --rotate normal \
  --output DP1 --off \
  --output HDMI1 --mode 2560x1440 --pos 0x0 --rotate normal \
  --output HDMI2 --off \
  --output VIRTUAL1 --off

polybar --quiet -r HDMI1 &
conky --quiet
random_wallpaper.sh
setxkbmap -layout us -variant intl

exit 0

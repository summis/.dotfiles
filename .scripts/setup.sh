#!/bin/sh
# Detect if external display is connected and based on that
# set appropriate bar+wallpaper+display configuration

NUMBER_OF_SCREENS=$(xrandr | grep " connected" | wc -l)

case $NUMBER_OF_SCREENS in
  1)
    HD.sh
    ;;

  2)
    UltraHD.sh
    ;;
esac

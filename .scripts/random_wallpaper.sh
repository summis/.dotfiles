#!/bin/bash
# Sets same random wallpaper on all monitors.

WALL=$(find "${HOME}/.wallpapers/" -type f | sort -R | tail -1)
feh --bg-fill "$WALL"

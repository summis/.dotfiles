#!/bin/bash
# Rofi menu for selecting monitor layouts

cd $HOME/.scripts/layouts
"$(ls | rofi -dmenu)"

exit 0

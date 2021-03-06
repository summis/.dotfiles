#!/bin/bash
# Google search from rofi.

url="https://www.google.com/search?q="
query=$( (echo ) | rofi  -dmenu -matching fuzzy -location 0 -p "Google search" )

if [[ -n "$query" ]]; then
    xdg-open "$url$query"
else
    exit
fi

exit 0

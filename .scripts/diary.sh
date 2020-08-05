#!/bin/sh
# Tests if diary entry for current day exists and creates one if doesn't exist.
# Otherwise just opens file with text editor
FILE=~/documents/diary/$(date +%Y%m%d.txt)

[ ! -f "$FILE" ] && echo $(date +%A)$'\n'$(date +'%Y-%m-%d klo %H:%M')$'\n\n' >> $FILE 

# open terminal for editor
kitty vim + $FILE > /dev/null

exit 0

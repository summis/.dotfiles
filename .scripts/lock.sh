#!/bin/sh
# Screenlock based on https://aur.archlinux.org/i3lock-color-git.git

blank='#00000000'
default='#ff00ffcc'
text='#ee00eeee'
wrong='#880000bb'
verify='#bb00bbaa'

i3lock \
--insidevercolor=$blank \
--ringvercolor=$verify \
--insidewrongcolor=$blank \
--ringwrongcolor=$wrong \
--insidecolor=$blank \
--ringcolor=$default \
--linecolor=$blank \
--separatorcolor=$default \
--verifcolor=$text \
--wrongcolor=$text \
--timecolor=$text \
--datecolor=$text \
--layoutcolor=$text \
--keyhlcolor=$wrong \
--bshlcolor=$wrong \
--screen 1 \
--blur 5 \
--clock \
--indicator \
--timestr="%H:%M:%S" \
--datestr="%d.%m.%Y" \
--radius 120 \
--veriftext="checking" \
--wrongtext=":(" \
--noinputtext="" \

#!/bin/sh
# Simple line printer that can can be used to make cool
# ssh login messages. Usage:
# - move this to for examle ~
# - add line: sh ~/line_printer.sh <file>
# to .zprofile, .profile or whatever configuration file
# to the server where you take ssh connection. <file>
# contains cool ascii art you want print.

while IFS="" read -r p || [ -n "$p" ];
do
    sleep 0.07
    printf '%s\n' "$p"
done < $1

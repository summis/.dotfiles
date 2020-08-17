#!/bin/bash
# Clean up downloads folder, remove anything that is not accessed for a while
# Usage: create following unit file for systemd in /etc/systemd/system/
# (name it for example tidy.service) and run:
# $ sudo systemctl daemon-reload
# $ systemctl enable tidy.service --now
########################################
#[Unit]
#Description="Remove old stuff from downloads folder"
#
#[Service]
#Type=oneshot
#RemainAfterExit=true
#ExecStop=/home/summis/.scripts/tidy.sh
#
#[Install]
#WantedBy=multi-user.target

FOLDER=/home/summis/downloads
LIMIT=14 # days

find "$FOLDER" -type f -atime +$LIMIT -exec rm '{}' \;

# ~/.bash_logout

# Clean up downloads folder, remove anything older than month.
find downloads/ -type f -atime +30 -exec rm '{}' \;

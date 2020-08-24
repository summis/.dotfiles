# ~/.bash_profile

# source environment variables
[ -r ~/.profile ] && source ~/.profile

# if running interactively include .bashrc
case "$-" in *i*) [ -r ~/.bashrc ] && source ~/.bashrc;; esac

# start i3 without display manager
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

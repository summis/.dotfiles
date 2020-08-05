# ~/.bash_profile

[ -r ~/.profile ] && source ~/.profile

# if running interactively include .bashrc
case "$-" in *i*) [ -r ~/.bashrc ] && source ~/.bashrc; esac

# ~/.bashrc

# if not running interactively, stop
[[ $- != *i* ]] && return

# promt
BOLD="\[$(tput bold)\]"
RESET="\[$(tput sgr0)\]"
GREY="\[$(tput setaf 244)\]"
PINK="\[$(tput setaf 201)\]"
BLUE="\[$(tput setaf 27)\]"
PS1="${BOLD}${GREY}[${PINK}\u@\h${BLUE} \W${GREY}]\$ ${RESET}"
PS2="${GREY}${BOLD}> ${RESET}"

# aliases and functions
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_functions ] && . ~/.bash_functions

# use bash-completion, if available: https://github.com/scop/bash-completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# z command: https://github.com/rupa/z/
[ -r /usr/share/z/z.sh ] && . /usr/share/z/z.sh

# allow local processes with root privileges to connect to the locally running X server
xhost +local:root > /dev/null 2>&1

# additional shell behaviours
shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend
shopt -s no_empty_cmd_completion

# set "unlimited" history size
HISTSIZE=10000000

# set default editor to vim
export VISUAL=vim
export EDITOR=vim

# look sty files from style subdir in latex projects
export TEXINPUTS=.:./style/:

# ~/.bashrc

# if not running interactively, stop
[[ $- != *i* ]] && return

# aliases and functions
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_functions ] && . ~/.bash_functions

# bash-completion: https://github.com/scop/bash-completion
[ -f /usr/share/bash-completion/bash_completion ] && \
    . /usr/share/bash-completion/bash_completion

# git-prompt: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
[ -f /usr/share/git/git-prompt.sh ] && . /usr/share/git/git-prompt.sh

# z: https://github.com/rupa/z/
[ -r /usr/share/z/z.sh ] && . /usr/share/z/z.sh

# kitty completions
. <(kitty + complete setup bash)

# prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
BOLD="\[$(tput bold)\]"
RESET="\[$(tput sgr0)\]"
GREY="\[$(tput setaf 244)\]"
PINK="\[$(tput setaf 201)\]"
BLUE="\[$(tput setaf 27)\]"

# TODO get rid of space before branch
PS1="${BOLD}${GREY}[${PINK}\u@\h${BLUE} \W${GREY}]\$(__git_ps1 )\$ ${RESET}"
PS2="${GREY}${BOLD}> ${RESET}"

# allow local processes with root privileges to connect to the locally running X server
xhost +local:root > /dev/null 2>&1

# additional shell behaviours
shopt -s autocd
shopt -s cdspell
shopt -s histappend
shopt -s no_empty_cmd_completion

# history
export HISTSIZE=10000000
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTCONTROL=erasedups

# variable definitions
export VISUAL=vim
export EDITOR=vim
export BROWSER=chromium
export TEXINPUTS=.:./style/:

export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export HISTSIZE=10000000
export HISTFILESIZE=10000000
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTCONTROL=erasedups
export VISUAL=vim
export EDITOR=vim
export BROWSER=firefox

# Colorful less.
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Add nice scripts to path.
export PATH=$PATH:$HOME/.scripts:$HOME/.scripts/layouts

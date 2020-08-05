# ~/.bashrc

# bash-completion: https://github.com/scop/bash-completion
[ -r /usr/share/bash-completion/bash_completion ] && \
    source /usr/share/bash-completion/bash_completion

# tab completion for aliases: https://github.com/cykerway/complete-alias
[ -r ~/.local/bin/complete_alias ] && source ~/.local/bin/complete_alias

# aliases, functions and completions
[ -r ~/.bash_aliases ] && source ~/.bash_aliases
[ -r ~/.bash_functions ] && source ~/.bash_functions
[ -r ~/.bash_completions ] && source ~/.bash_completions

# git-prompt: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
[ -r /usr/share/git/git-prompt.sh ] && source /usr/share/git/git-prompt.sh

# z: https://github.com/rupa/z/
[ -r /usr/share/z/z.sh ] && source /usr/share/z/z.sh

# additional completions that are used if program exist
hash kitty >/dev/null 2>&1 && source <(kitty + complete setup bash)

# commented command made my prompt a bit slow. Piping output to file
# kubectl completion bash > ~/.kubectl_completions.sh
# and sourcing it made it faster
#hash kubectl >/dev/null 2>&1 && source <(kubectl completion bash)
[ -r ~/.scripts/kubectl_completions.sh ] && source ~/.scripts/kubectl_completions.sh

# prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
BOLD="\[$(tput bold)\]"
RESET="\[$(tput sgr0)\]"
GREY="\[$(tput setaf 244)\]"
PINK="\[$(tput setaf 201)\]"
BLUE="\[$(tput setaf 27)\]"

PS1="${BOLD}${GREY}[${PINK}\u@\h${BLUE} \W${GREY}\$(__git_ps1 \" (%s)\")]\$ ${RESET}"
PS2="${GREY}${BOLD}> ${RESET}"

# allow local processes with root privileges to connect to the locally running X server
xhost +local:root > /dev/null 2>&1

# additional shell behaviours
shopt -s autocd
shopt -s cdspell
shopt -s histappend
shopt -s no_empty_cmd_completion

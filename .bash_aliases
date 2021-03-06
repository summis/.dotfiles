# ~/.bash_aliases

# Dotfile management.
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Enhancements to default programs.
alias cp='cp -i'
alias df='df -h'
alias free='free -m'
alias nmcli='nmcli -p'
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias hgrep='history | grep'
alias R='R --quiet'
alias sxiv='sxiv -at'

# Common typos.
alias ehco=echo
alias sl=ls
alias s=ls
alias ncmli=nmcli
alias nclim=nmcli
alias mkdri=mkdir
alias cim=vim
alias im=vim
alias bim=vim
alias ivm=vim
alias xcilp=xclip
alias xlcip=xclip
alias xlip=xclip
alias Z=z

# Git aliases.
alias gad='git add'
alias gco='git commit'
alias gst='git status'
alias glo='git log --oneline'
alias gbr='git branch'
alias gch='git checkout'

# Use docker container for pdflatex.
alias pdflatex='docker run -it --rm -v $(pwd):/project summila/alpine-texlive'

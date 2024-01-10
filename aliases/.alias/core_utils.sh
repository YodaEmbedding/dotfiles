### CORE UTILITIES ###

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'

# cp
alias cp='cp -i'

# less
alias less='less -r'

# ls
alias l='ll'
alias ll='ls -l'
alias ls='ls --color=auto -h --group-directories-first --time-style="+%Y-%m-%d %H:%M:%S"'
alias ls_symbolic='ls -al --color=always | grep "\->"'

# mv
alias mv='mv -i'

# sudo
alias sudo='sudo '   # make sudo work with aliases
alias s='sudo'
alias se='sudo -e'
alias sudoloop='sudo true; while true; do sudo -v; sleep 60; done &'

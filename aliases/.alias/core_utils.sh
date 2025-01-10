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
LS_OPTIONS='--color=auto -h --time-style="+%Y-%m-%d %H:%M:%S" --group-directories-first'
alias l='ll'
alias ll='ls -l'
alias ls="ls ${LS_OPTIONS}"
alias ls_symbolic='ls -al --color=always | grep "\->"'

# mv
alias mv='mv -i'

# sudo
alias sudo='sudo '   # make sudo work with aliases
alias s='sudo'
alias se='sudo -e'
alias sudoloop='sudo true; while true; do sudo -v; sleep 60; done &'

if [[ "$OSTYPE" == "darwin"* ]]; then
  if command -v gls &> /dev/null; then
    alias ls="gls ${LS_OPTIONS}"
    alias dircolors='gdircolors'
  else
    alias ls='ls --color=auto -h -D "%Y-%m-%d %H:%M:%S"'
  fi
fi

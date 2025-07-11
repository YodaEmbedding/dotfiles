# If not running interactively, don't do anything
[[ $- != *i* ]] && return

echo ".bashrc sourced with -$-"

# Prompt (see also: PS2,3,4)
PS1='[\u@\h \W]\$ '

# Source
[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

# Options
shopt -s extglob  # extended glob functionality

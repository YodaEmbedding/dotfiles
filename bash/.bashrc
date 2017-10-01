#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Primary prompt displayed before each command (see also: PS2,3,4)
PS1='[\u@\h \W]\$ '

# Source aliases
if [ -f ~/.aliases ]; then
. ~/.aliases
fi

# CUSTOM CONFIGURATIONS

# Fuzzy file finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# cd then ls
cdd() { cd "$@" && ls; }
#cdd() { cd "$@" && tree -dL 1; }

# mv then cd then ls
mvv() { mv "$@" && cdd "$2"; }

# Run process in background
# https://stackoverflow.com/questions/10408816/how-do-i-use-the-nohup-command-without-getting-nohup-out
bgrnd() {
	nohup "$@" </dev/null >/dev/null 2>&1 &
	disown
}

# redshift
#rs() { echo "$1" > ~/.rshift && redshift -O "$1"; }

# Source autojump
source /etc/profile.d/autojump.bash

# Other options
shopt -s extglob  # extended glob functionality


export EDITOR=nvim
export VISUAL=nvim

PATH="$HOME/.local/bin:$PATH"
PATH="$PATH:/cvmfs/soft.computecanada.ca/custom/bin/computecanada"
export PATH

export SHELL=/cvmfs/soft.computecanada.ca/gentoo/2020/bin/zsh

# Disable automatic shell timeout set in /etc/environment.
export TMOUT=0

CLUSTER="$(hostname | perl -ne '/.*?(\w+).computecanada.ca/ && print "$1"')"
export CLUSTER

HOSTNAME="$(hostname)"

case "$HOSTNAME" in
  *beluga*)
    TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour117"
    ;;
  *cedar*)
    TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour186"
    ;;
  *gra-login*)  # graham
    TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour72"
    ;;
  *narval*)
    TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour245"
    ;;
  *)
    TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour182"
    ;;
esac

export TMUX_STATUS_STYLE

export RUNS_ROOT="$HOME/data/runs/cc/$CLUSTER"

MODULES=(
  gcc
  # nodejs
  # python/3.9.6
  # python/3.10.2
  # python/3.10.13
  python/3.11.5
  rust
)

# echo "Loading modules..."
module load "${MODULES[@]}"
# echo "Loaded modules"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

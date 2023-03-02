export EDITOR=nvim
export VISUAL=nvim

PATH="$HOME/.local/bin:$PATH"
PATH="$PATH:/cvmfs/soft.computecanada.ca/custom/bin/computecanada"
export PATH

export SHELL=/cvmfs/soft.computecanada.ca/gentoo/2020/bin/zsh

# Disable automatic shell timeout set in /etc/environment.
export TMOUT=0

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

# echo "Loading module python..."
module load python/3.9.6
# echo "Loaded module python"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

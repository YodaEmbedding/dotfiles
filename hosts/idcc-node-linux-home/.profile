EDITOR=nvim
VISUAL=nvim

PATH="$HOME/.local/bin:$PATH"
export PATH

export SHELL=/bin/zsh

HOSTNAME="$(hostname)"

case "$HOSTNAME" in
  kopsvgd13p)
    TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour117"
    ;;
  # *beluga*)
  #   TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour117"
  #   ;;
  # *cedar*)
  #   TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour186"
  #   ;;
  # *gra-login*)
  #   TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour72"
  #   ;;
  # *narval*)
  #   TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour245"
  #   ;;
  *)
    TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour182"
    ;;
esac

export TMUX_STATUS_STYLE

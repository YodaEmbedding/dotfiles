if [[ -n "$_COMMON_PROFILE_LOADED" ]]; then
  return
fi

_COMMON_PROFILE_LOADED=1


if [[ -z "$HOSTNAME" ]]; then
  export HOSTNAME=$(hostname)
  echo "HOSTNAME manually set to $HOSTNAME"
fi


export EDITOR="nvim"
export VISUAL="nvim"


PATH="$HOME/.local/homebrew/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
PATH="$HOME/.cabal/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/.local/bin_python:$PATH"
export PATH


# Other names were considered, but this is the most polite.
# (Other names include: anarchy, chaotic, rebel, rogue, stubborn-devs, unlawful, unruly, etc.)
export XDG_WILD_HOME="$HOME/.local/wild"

# export CARGO_HOME="$XDG_WILD_HOME/cargo"
export IPYTHONDIR="$XDG_WILD_HOME/ipython"


export GOPATH="$HOME/.cache/go"
export JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/jupyter"
# export NVIM_LOG_FILE="$HOME/.cache/nvim/nvimlog"
export PYTHONSTARTUP="$HOME/.config/python/pythonstartup.py"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/rc"


export FILTER_BRANCH_SQUELCH_WARNING=1
if command -v fd &> /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f'
fi
export GPG_TTY=$(tty)
if command -v bat &> /dev/null; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export MANROFFOPT="-c"
fi
export RUST_BACKTRACE=1
export TF_CPP_MIN_LOG_LEVEL=2
export TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour250"


case "$HOSTNAME" in

  PC-Mordor-*)
    export CLASSPATH=""
    export TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour104"

    case "$HOSTNAME" in
      PC-Mordor-Arch)
        export RUNS_ROOT="$HOME/data/runs/pc-mordor"
        # export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
        export RUST_SRC_PATH="$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
      ;;
      PC-Mordor-NixOS)
        export FZF_BASE=/run/current-system/sw/bin/fzf
      ;;
    esac
  ;;


  *.computecanada.ca)
    PATH="$PATH:/cvmfs/soft.computecanada.ca/custom/bin/computecanada"
    export PATH

    export SHELL=/cvmfs/soft.computecanada.ca/gentoo/2020/bin/zsh

    # Disable automatic shell timeout set in /etc/environment.
    export TMOUT=0

    CLUSTER="$(hostname | perl -ne '/.*?(\w+).computecanada.ca/ && print "$1"')"
    export CLUSTER

    case "$HOSTNAME" in
      *beluga*)     TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour117" ;;
      *cedar*)      TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour186" ;;
      *gra-login*)  TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour72"  ;;  # graham
      *narval*)     TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour245" ;;
      *)            TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour182" ;;
    esac
    export TMUX_STATUS_STYLE

    MODULES=(
      gcc
      python/3.11.5
      rust
    )
    module load "${MODULES[@]}"

    # Generated for envman. Do not edit.
    [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

    export RUNS_ROOT="$HOME/data/runs/cc/$CLUSTER"

    ;;


  L10142|L10142.local)  # idcc-macOS
    export TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour104"

    # Fix tmux-256color on MacOS
    # /usr/local/opt/ncurses/bin/infocmp -x tmux-256color > ~/tmux-256color.src
    # sed -e "pairs#0x10000/pairs#0xFFFF" -i ~/tmux-256color.src
    # /usr/bin/tic -x -o $HOME/.local/share/terminfo tmux-256color.src
    export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo

    eval "$(/opt/homebrew/bin/brew shellenv)"

    PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH"
    export PATH

    ulimit -n unlimited

    ;;


  kopsgrid*|kopsvgd*p)  # idcc-node-linux
    export SHELL=/bin/zsh
    export TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour117"

    ;;


  jetson-*)
    case "$HOSTNAME" in
      jetson-agx-orin*)   TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour81"  ;;
      jetson-orin-nano*)  TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour212" ;;
      *)                  ;;
    esac
    export TMUX_STATUS_STYLE

    ;;


  *)
    ;;

esac

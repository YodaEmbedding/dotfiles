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

PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
PATH="$HOME/.cabal/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/.local/bin_python:$PATH"
PATH="$HOME/.local/bin:$PATH"
export PATH

export FILTER_BRANCH_SQUELCH_WARNING=1
if command -v fd &> /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f'
fi
export GOPATH="$HOME/.cache/go"
export GPG_TTY=$(tty)
# export JUPYTERLAB_DIR="$HOME/.local/share/jupyter/lab"
if command -v bat &> /dev/null; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export MANROFFOPT="-c"
fi
# export NVIM_LOG_FILE="$HOME/.cache/nvim/nvimlog"
export PYTHONSTARTUP="$HOME/.config/python/pythonstartup.py"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/rc"
export RUST_BACKTRACE=1
export TF_CPP_MIN_LOG_LEVEL=2
export TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour250"


case "$HOSTNAME" in

  PC-Mordor-Arch)
    export CLASSPATH=""
    export RUNS_ROOT="$HOME/data/runs/pc-mordor"
    # export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
    export RUST_SRC_PATH="$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
    export TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour104"

    ;;


  PC-Mordor-NixOS)
    export CLASSPATH=""
    export FZF_BASE=/run/current-system/sw/bin/fzf
    # export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
    # export RUST_SRC_PATH="$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
    export TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour104"

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


  kopsvgd*p)  # idcc-node-linux
    export SHELL=/bin/zsh
    export TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour117"

    ;;


  jetson-agx-orin*)
    export TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour81"

    ;;


  jetson-orin-nano*)
    export TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour212"

    ;;


  *)
    ;;

esac

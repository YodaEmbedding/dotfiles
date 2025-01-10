if [[ -n "$_COMMON_PROFILE_LOADED" ]]; then
  return
fi

_COMMON_PROFILE_LOADED=1


if [[ -z "$HOSTNAME" ]]; then
  export HOSTNAME=$(hostname)
fi


export EDITOR="nvim"
export VISUAL="nvim"

PATH="$HOME/.local/bin_python:$PATH"
PATH="$HOME/.local/bin:$PATH"
export PATH

export GPG_TTY=$(tty)


case "$HOSTNAME" in

  PC-Mordor-Arch)
    PATH="$PATH:$HOME/.cabal/bin"
    PATH="$PATH:$HOME/.cargo/bin"
    export PATH

    export CLASSPATH=""
    export FILTER_BRANCH_SQUELCH_WARNING=1
    export FZF_DEFAULT_COMMAND='fd --type f'
    export GOPATH="$HOME/.cache/go"
    # export JUPYTERLAB_DIR="$HOME/.local/share/jupyter/lab"
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    export MANROFFOPT="-c"
    export NVIM_LOG_FILE="$HOME/.cache/nvim/nvimlog"
    export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/rc"
    export RUNS_ROOT="$HOME/data/runs/pc-mordor"
    export RUST_BACKTRACE=1
    # export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
    export RUST_SRC_PATH="$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
    export TF_CPP_MIN_LOG_LEVEL=2
    export TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour104"
    # eval "$(pyenv init --path)"

    ;;


  PC-Mordor-NixOS)
    export TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour104"
    # fg = colour4 colour104 colour182 colour183 colour189 colour225

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

    ;;


  L10142.local)  # idcc-macOS
    export TMUX_STATUS_STYLE="bold,bg=colour234,fg=colour104"
    # fg = colour4 colour104 colour182 colour183 colour189 colour225

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


  *)
    ;;

esac

# MacOS coreutils aliases
alias dircolors="gdircolors"
alias ls="gls"

# Fix tmux-256color on MacOS
# /usr/local/opt/ncurses/bin/infocmp -x tmux-256color > ~/tmux-256color.src
# sed -e "pairs#0x10000/pairs#0xFFFF" -i ~/tmux-256color.src
# /usr/bin/tic -x -o $HOME/.local/share/terminfo tmux-256color.src
export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo

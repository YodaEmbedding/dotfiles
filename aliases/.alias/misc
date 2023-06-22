### MISCELLANEOUS ###

# Commands list
#alias commands='compgen -c'
alias commands='print -rl -- ${(k)aliases} ${(k)functions} ${(k)parameters} ${(k)builtins} ${(k)commands} | fzf'

# Dropdown terminal
alias dropdown='b alacritty --class dropdown -e tmux new-session -A -s 0 &'
alias dropdowna='b alacritty --class dropdown -e tmux attach -t 0 &'

# emoji
alias lenny='emoji -lc'
alias shruggie='emoji -sc'

# File opening (in background)
bgrnd() {
  nohup "$@" </dev/null >/dev/null 2>&1 &
  disown
}

alias b='bgrnd'
alias o='bgrnd xdg-open'

# Files per directory.
files_per_directory() {
  /bin/fd -uu --type d --max-depth=1 '' | sort | while read d; do
    printf '%8d  %s\n' $(/bin/fd -uu --type f '' "$d" | wc -l) "$(du -sh "$d")"
  done
}

# Fix date by parsing it from filename.
# Expected format:  YYYY-mm-dd_HH-MM-SS*
# For example:      2020-12-31_23-59-59_filename.txt
fix_date_using_filename() {
  local f="$1"
  local date_tokens="$( (cut -c 1-19 | sed 's/[_-]/ /g') <<< "${f%.*}")"
  local date_str="$(printf '%s-%s-%s %s:%s:%s' $date_tokens)"
  touch -m --date="${date_str}" "$f"
}

# Monitor control
mbc() {
  sudo bash -c 'ddccontrol -p -r 0x10 -w $0 >/dev/null 2>&1 && ddccontrol -p -r 0x12 -w $0 >/dev/null 2>&1 &' "$1"
}

mbc2() {
  sudo bash -c 'ddccontrol -p -r 0x10 -w $0 >/dev/null 2>&1 && ddccontrol -p -r 0x12 -w $1 >/dev/null 2>&1 &' "$1" "$2"
}

brightness() {
  sudo bash -c 'ddccontrol -p -r 0x10 -w $0 >/dev/null 2>&1 &' "$1"
}

contrast() {
  sudo bash -c 'ddccontrol -p -r 0x12 -w $0 >/dev/null 2>&1 &' "$1"
}

# Power
alias windows='sudo grub-reboot "Windows 10 (on /dev/sda1)" && reboot'

# Processes
alias pid='ps -eo user,pid,%mem,command --sort=%mem | fzf --tac | sed "s/^[^ ]* *\([0-9]\+\) .*$/\1/"'

# Update ~/.locate.db
alias updatelocate='systemctl --user --no-block start update-locate.service'

# Update blocklists
alias updateblocklist='wget https://github.com/Naunter/BT_BlockLists/raw/master/bt_blocklists.gz -NP ~/.config/qBittorrent && gunzip -kf ~/.config/qBittorrent/bt_blocklists.gz && cd ~/.config/qBittorrent && /bin/mv bt_blocklists bt_blocklists.p2p'

# Update frece databases
alias updatefrece='systemctl --user --no-block start update-frece-dir.service; systemctl --user --no-block start update-frece-file.service'

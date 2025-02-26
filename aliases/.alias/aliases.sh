### CORE UTILITIES ###

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'

# cp
alias cp='cp -i'

# less
alias less='less -r'

# ls
LS_OPTIONS='--color=auto -h --time-style="+%Y-%m-%d %H:%M:%S" --group-directories-first'
alias l='ll'
alias ll='ls -l'
alias ls="ls ${LS_OPTIONS}"
alias ls_symbolic='ls -al --color=always | grep "\->"'

# mv
alias mv='mv -i'

# sudo
alias sudo='sudo '   # make sudo work with aliases
alias s='sudo'
alias se='sudo -e'
alias sudoloop='sudo true; while true; do sudo -v; sleep 60; done &'

if [[ "$OSTYPE" == "darwin"* ]]; then
  if command -v gls &> /dev/null; then
    alias ls="gls ${LS_OPTIONS}"
    alias dircolors='gdircolors'
  else
    alias ls='ls --color=auto -h -D "%Y-%m-%d %H:%M:%S"'
  fi
fi




### IMPORTANT UTILITIES ###

# git
alias g='git'
alias ga='git add'
alias gap='git add -p'
alias gbr='git branch'
alias gc='git commit'
alias gca='git commit -a'
alias gcA='git commit --amend'
alias gcAn='git commit --amend --no-edit'
alias gcaa='git commit --amend'
alias gcaan='git commit --amend --no-edit'
alias gcam='git commit -am'
alias gcl='git clone'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -B'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --color --oneline --graph --full-history'
alias gla='git log --color --oneline --graph --full-history --branches --remotes --tags'
alias gle='git log --graph --decorate $(git rev-list -g --branches --remotes --tags)'
alias gp='git push'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbca='git_continue "git add -u && git rebase --continue"'
alias grbi='git rebase --interactive'
alias gre='git reset'
alias grs='git reset'
alias grsh='git reset HEAD'
alias grsh~='git reset HEAD~'
alias gs='git status'
alias gsh='git show'
alias gw='git worktree'
alias gwa='git worktree add'
alias gwl='git worktree list'
alias gwr='git worktree remove'

alias gcd='git_commit_date_sign'
alias gcmd='git_commit_date_sign -m'
alias gitc='git_commit_select'
alias gitd='git_commit_browse'
alias gith='git_history_browse'

alias chore='git_commit_message_with_prefix "chore: "'
alias chored='git_commit_message_with_prefix "chore(deps): "'
alias chorer='git_commit_message_with_prefix "chore(release): "'
alias docs='git_commit_message_with_prefix "docs: "'
alias feat='git_commit_message_with_prefix "feat: "'
alias fix='git_commit_message_with_prefix "fix: "'
alias perf='git_commit_message_with_prefix "perf: "'
alias refactor='git_commit_message_with_prefix "refactor: "'
alias style='git_commit_message_with_prefix "style: "'
alias wip='git_commit_message_with_prefix "wip: "'

alias chore:='git_commit_message_with_prefix_easy "chore: "'
alias chored:='git_commit_message_with_prefix_easy "chore(deps): "'
alias chorer:='git_commit_message_with_prefix_easy "chore(release): "'
alias docs:='git_commit_message_with_prefix_easy "docs: "'
alias feat:='git_commit_message_with_prefix_easy "feat: "'
alias fix:='git_commit_message_with_prefix_easy "fix: "'
alias perf:='git_commit_message_with_prefix_easy "perf: "'
alias refactor:='git_commit_message_with_prefix_easy "refactor: "'
alias style:='git_commit_message_with_prefix_easy "style: "'
alias wip:='git_commit_message_with_prefix_easy "wip: "'

git_commit_message_with_prefix() {
  local prefix="$1"
  shift 1
  local message="$1"
  if [ "$#" -lt 1 ]; then
    # If no message, trim ": " from the prefix.
    prefix="${prefix%: }"
  else
    shift 1
  fi
  local args=("$@")
  git commit -m "${prefix}${message}" "${args[@]}"
}

git_commit_message_with_prefix_easy() {
  local prefix="$1"
  shift 1
  local message="$@"
  if [ "$#" -lt 1 ]; then
    # If no message, trim ": " from the prefix.
    prefix="${prefix%: }"
  else
    shift 1
  fi
  git commit -m "${prefix}${message}"
}

git_commit_browse() {
  local out=$(git log --oneline --color | fzf --ansi --multi --reverse)
  local sha=$(awk '{ print $1 }' <<< "$out")
  [ -n "$sha" ] && git show "$sha"
}

git_commit_date() {
  local commit_date="$1"
  shift
  GIT_COMMITTER_DATE="$commit_date" git commit --date "$commit_date" $@
}

git_commit_date_sign() {
  local commit_date="$1"
  shift
  echo "Commit date:      $commit_date"
  LD_PRELOAD=/run/current-system/sw/lib/libfaketime.so.1 \
    FAKETIME="@$commit_date" \
    GIT_COMMITTER_DATE="$commit_date" \
    git commit --date "$commit_date" $@
}

git_commit_date_sign_fix() {
  local author_date="$(git show -s --format=%ai)"
  local commit_date="$(git show -s --format=%ci)"
  local new_sign_date="$(git show -s --format=%ci)"
  echo "Prev author date: $author_date"
  echo "New author date:  $commit_date"
  echo "Commit date:      $commit_date"
  echo "New sign date:    $new_sign_date"
  LD_PRELOAD=/run/current-system/sw/lib/libfaketime.so.1 \
    FAKETIME="@$new_sign_date" \
    GIT_COMMITTER_DATE="$commit_date" \
    git commit --date "$commit_date" $@
}

git_commit_date_branch_fix() {
  git filter-branch -f --commit-filter '
    git rev-parse "$GIT_COMMIT" >&2
    git show -s --format=%ci "$GIT_COMMIT" >&2
    echo "" >&2
    export author_date="$(git show -s --format=%ai "$GIT_COMMIT")"
    export LD_PRELOAD=/run/current-system/sw/lib/libfaketime.so.1
    export FAKETIME="@$author_date";
    export GIT_AUTHOR_DATE="$author_date"
    export GIT_COMMITTER_DATE="$author_date"
    git commit-tree -S "$@"
  ' $@
}

git_commit_select() {
  local out=$(git log --oneline --color | fzf --ansi --multi --reverse)
  local sha=$(awk '{ print $1 }' <<< "$out")
  echo "$sha"
}

git_continue() {
  git ls-files --exclude-standard --deduplicate -z | xargs -0 rg '<+ HEAD' | ifne -n zsh -c "$1"
}

git_history_browse() {
  local out sha q
  while out=$(
      git log --graph --color=always \
          --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" |
      fzf --ansi --multi --reverse --query="$q" --print-query); do
    q=$(head -1 <<< "$out")
    while read sha; do
      [ -n "$sha" ] && git show --color=always $sha | less -R
    done < <(sed '1d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
  done
}

# python
alias p='python'
alias py='python'

# rsync
alias rsync="rsync -h"
alias rscp="rsync -a --progress --partial"
# alias rscp="rsync -a --info=progress2 --partial"

# systemctl
alias sy='systemctl'
alias syu='systemctl --user'
alias sydr='systemctl daemon-reload'
alias sydru='systemctl daemon-reload --user'
alias syd='systemctl disable'
alias sydu='systemctl disable --user'
alias sye='systemctl enable'
alias syeu='systemctl enable --user'
alias syr='systemctl restart'
alias syru='systemctl restart --user'
alias syst='systemctl start'
alias systu='systemctl start --user'
alias sys='systemctl status'
alias sysu='systemctl status --user'
alias syz='systemctl stop'
alias syzu='systemctl stop --user'

# systemctl --user
alias syu='systemctl --user'
alias syudr='systemctl --user daemon-reload'
alias syud='systemctl --user disable'
alias syue='systemctl --user enable'
alias syur='systemctl --user restart'
alias syust='systemctl --user start'
alias syus='systemctl --user status'
alias syuz='systemctl --user stop'

# vim
alias v='nvim'
alias vim='nvim'
alias vimprivate='vim -u NONE -c "setlocal history=0 nobackup nomodeline noshelltemp noswapfile noundofile nowritebackup secure viminfo=\"\""'
alias vp='nvim_mkdir'

nvim_mkdir() {
  local filename="$1"
  mkdir -p "$(dirname "$filename")"
  nvim "$filename"
}




### OTHER UTILITIES ###

# at
alias atqq='for j in $(atq | sort -k6,6 -k3,3M -k4,4 -k5,5 | cut -f 1); do atq | grep -P "^$j\t" | tr "\n" "\t"; at -c "$j" | tail -n 2 | head -n 1; done'
alias atqqq='for j in $(atq | sort -k6,6 -k3,3M -k4,4 -k5,5 | cut -f 1); do atq | grep -P "^$j\t"; at -c "$j" | tail -n 2; done'

# bat
alias c='bat'

batw() {
  # bat with word wrapping.
  local f="$1"
  fold -s "$f" | bat --language="${f##*.}" "${@:2}"
}

# biber
biber_fix() {
  file="$1"
  tmpfile="$(mktemp /tmp/biber.bib.XXXXXX)"
  biber \
    --tool \
    --output_align \
    --output_indent=2 \
    --output_fieldcase=lower \
    --output-file="$tmpfile" \
    "$file" || return 1
  /bin/mv "$tmpfile" "$file"
}

biber_fix_bibtex() {
  file="$1"
  tmpfile="$(mktemp /tmp/biber.bib.XXXXXX)"
  biber \
    --tool \
    --output_format=bibtex \
    --output-legacy-dates \
    --output-field-replace=location:address,journaltitle:journal \
    --output_align \
    --output_indent=2 \
    --output_fieldcase=lower \
    --output-file="$tmpfile" \
    "$file" || return 1
  /bin/mv "$tmpfile" "$file"
}

# clipboard
if ! command -v "pbcopy" &> /dev/null; then
  if [ ! -z "${WAYLAND_DISPLAY}" ]; then
    PBCOPY="wl-copy"
  else
    PBCOPY="xclip -selection clipboard"
  fi
  alias pbcopy="${PBCOPY}"
fi

if ! command -v "pbpaste" &> /dev/null; then
  if [ ! -z "${WAYLAND_DISPLAY}" ]; then
    PBPASTE="wl-paste"
  else
    PBPASTE="xclip -selection clipboard -o"
  fi
  alias pbpaste="${PBPASTE}"
fi

# fd
alias fd="fd --hidden --exclude .git"

# ffmpeg
ffmpeg_trim() {
  if [ "$1" = "--help" ]; then
    echo "Usage: ffmpeg_trim <file> <start> <end> [ffmpeg args...]"
    return 0
  fi

  local f="$1"
  local start="$2"
  local end="$3"
  local args=("${@:4}")
  local outfile="${f%.*}.trim.${f##*.}"
  local date_str
  date_str="$(stat -c %y "$f")"

  ffmpeg -ss "$start" -to "$end" -i "$f" -c copy -map 0 "${args[@]}" "$outfile"

  # Copy over last modified date, too.
  touch -m "$outfile" --date="${date_str}"
}

ffmpeg_reencode() {
  if [ "$1" = "--help" ]; then
    echo "Usage: ffmpeg_reencode <file> [c_v] [crf] [c_a] [b_a] [outfile] [ffmpeg args...]"
    return 0
  fi

  local f="$1"
  local c_v="${2:-libx265}"
  local crf="${3:-30}"
  local c_a="${4:-libopus}"
  local b_a="${5:-64K}"
  local outfile="${f%.*}.reencode.${f##*.}"
  local outfile="${6:-"$outfile"}"
  local args=("${@:7}")
  local date_str
  date_str="$(stat -c %y "$f")"

  nice -n 19 \
    ffmpeg -i "$f" \
    -c:v "${c_v}" -crf "${crf}" \
    -c:a "${c_a}" -b:a "${b_a}" \
    "${args[@]}" \
    "$outfile"

    # -c copy -map 0 \

  # Copy over last modified date, too.
  touch -m "$outfile" --date="${date_str}"
}

# fselect
fselect_by_size() {
  query="$1"
  fselect "select FORMAT_SIZE(size, '%.0 s'), $query" |
    awk -v FS='\t' -v OFS='\t' '{
      size=$1; split(size, xs, " ");
      num=xs[1]; unit=xs[2];
      # print size
      printf "%5d %s", num, tolower(unit);
      # print remaining line
      $1=""; print $0;
    }'
}

# gpg
alias gpgaddkey="gpg --recv-keys"
alias gpgforgetpassphrases='echo RELOADAGENT | gpg-connect-agent'

# htop
alias htop_cpu="htop --sort-key=PERCENT_CPU"
alias htop_mem="htop --sort-key=PERCENT_MEM"

# lf
lfcd() {
  local dir
  dir="$(command lf -print-last-dir "$@")"
  [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] || return
  cd "$dir"
}

alias l="lfcd"

# nix-shell
alias nx="nix-shell"
alias nxz='nix-shell --command "PROMPT_BGCOLOR=60 PROMPT_NAME=nix zsh"'
alias nz='nxz'
alias nzp='nxz -p'

# nixos
alias nxor="sudo nixos-rebuild"

# nnn
alias n='nnn'

# parallel
alias parallel='parallel --will-cite'

# poetry
alias po='poetry'
alias poa='poetry add'
alias poi='poetry install'
alias pol='poetry lock'
alias por='poetry run'
alias porp='poetry run python'
alias pos='poetry shell'
alias posh='poetry_shell'
alias pou='poetry-user'
alias poua='poetry-user add'

alias poetry-user='poetry --directory ~/.config/pypoetry/envs/default'

poetry_shell() {
  local d="$PWD"
  cd "$1"
  local venv="$(poetry env info --path)"
  cd "$d"
  source "$venv/bin/activate"
}

# ptpython
alias pp="PYTHONSTARTUP=$HOME/dotfiles/root/usr/local/share/pythonstartup.py ptpython"
alias ptpy='tmux rename-window "py"; pp'

# ranger (open navigated folder in terminal on exit)
alias r='ranger'
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# ripgrep
alias rg="rg --hidden --glob '!.git' --smart-case"
alias rgi='rg --ignore-case'
alias rgs='rg --case-sensitive'
alias rgpy='rg -t py'

# stat
alias stat_filedate='stat -c "%y"'
alias stat_filesize='stat -c "%s"'
alias stat_perm='stat -c "%a %n"'

# tar
tarf() {
  tar czf "$1.tar.gz" "$1"
}

tarfprog() {
  tar cf - "$1" -P | pv -s $(du -sb "$1" | awk '{print $1}') | gzip > "$1.tar.gz"
}

# todo.sh
alias t="todo.sh"

# thunar
alias th='bgrnd thunar'

# uv
alias uvu='uv-user'
alias uvupip='uv --directory="$HOME/.config/uv/envs/default" pip'

alias uv-user='uv --project="$HOME/.config/uv/envs/default"'

# wtwitch
alias tw='wtwitch'
alias tw_online="wtwitch c | sed '/^ Offline:\$/,\$d'"
alias tw_watch="tw_online | grep '^  ' | fzf --ansi | sed 's/^   \\([^:]\\+\\).*/\\1/' | xargs wtwitch watch"
alias twc='tw_online'
alias tws='wtwitch sub'
alias tww='tw_watch'

# yazi
alias y='yazicd'

# Perhaps a better version of this is available here:
# https://yazi-rs.github.io/usage/quick-start#changing-working-directory-when-exiting-yazi
yazicd() {
  tmp="$(mktemp -t 'yazi-cwd.XXXXXX')"
  yazi --cwd-file="$tmp" "$@"
  [ -f "$tmp" ] || return
  dir="$(cat "$tmp")"
  rm -f "$tmp"
  [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] || return
  cd "$dir"
}

# zip
zipf() {
  zip -r "$1.zip" "$1"
}




### PACKAGE MANAGEMENT ###

# Pacman
alias sp='sudo pacman'
alias sps='sudo pacman -S'
alias orphans='pacman -Qtdq'

# AUR package managers: paru
alias parus='paru -S'
alias paruq='paru -Qs'
alias paruss='paru -Ss'

# AUR package managers: pikaur
alias pk='pikaur'
alias pkq='pikaur -Qs'
alias pks='pikaur -S --noconfirm'
alias pku='pikaur -Syu'

# AUR package managers: trizen
alias tz='trizen'
alias tzq='trizen -Qs'
alias tzs='trizen --noedit -S'
alias tzu='trizen --noedit -Syu'

# AUR package managers: yay
alias yayq='yay -Qs'
alias yays='yay -S --noconfirm --nocleanmenu --nodiffmenu --noeditmenu --noredownload --norebuild --needed'
alias yayu='yay -Syu --noconfirm --nocleanmenu --nodiffmenu --noeditmenu --noredownload --norebuild --needed --ignore="$(tr "\n" "," < ~/.pkgignorelist)"'
alias yaya='yay -aSyu --noconfirm --nocleanmenu --nodiffmenu --noeditmenu --noredownload --norebuild --needed --ignore="$(tr "\n" "," < ~/.pkgignorelist)"'

# AUR: misc
aururl() {
  xdg-open "https://aur.archlinux.org/packages/$1"
}

# Homebrew
alias bi='brew install'
alias bic='brew install --cask'




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
  (
    unalias -a
    \fd -uu --type d --max-depth=1 '' | sort | while read d; do
      printf '%8d  %s\n' $(\fd -uu --type f '' "$d" | wc -l) "$(du -sh "$d")"
    done
  )
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




### FILE PATHS ###

# File common
alias todo='vim ~/Dropbox/misc/notepad/todo-txt/todo.txt'

# File config
alias aliases='cd ~/dotfiles/aliases/.alias; f="$(fd | fzf)" && vim "$f"'
alias bashrc='vim ~/.bashrc'
alias dotfiles='cd ~/dotfiles; vim'
alias i3config='cd ~/dotfiles/i3/.config/i3/conf.d; f="$(fd | fzf)" && vim "$f"'
alias nvimrc='cd ~/dotfiles/nvim/.config/nvim/lua; vim'
alias pythonstartup='sudo -e /usr/local/share/pythonstartup.py'
alias vimrc='cd ~/dotfiles/vim/.vim; f="$(fd -e vim | fzf)" && vim "$f"'
alias zshrc='vim ~/.zshrc'

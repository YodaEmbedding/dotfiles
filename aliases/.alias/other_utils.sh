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

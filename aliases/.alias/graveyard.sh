## GRAVEYARD ##


### CORE UTILITIES ###

# ls
alias ls_symbolic='ls -al --color=always | grep "\->"'




### IMPORTANT UTILITIES ###

# git
alias gplr='git pull --rebase'
alias gre='git reset'
alias grsh='git reset HEAD'
alias grsh~='git reset HEAD~'

alias gcd='git_commit_date_sign'
alias gcdm='git_commit_date_sign --message'
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
  git commit --message "${prefix}${message}" "${args[@]}"
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
  git commit --message "${prefix}${message}"
}

# python
alias py='python'




### OTHER UTILITIES ###

# at
alias atqq='for j in $(atq | sort -k6,6 -k3,3M -k4,4 -k5,5 | cut -f 1); do atq | grep -P "^$j\t" | tr "\n" "\t"; at -c "$j" | tail -n 2 | head -n 1; done'
alias atqqq='for j in $(atq | sort -k6,6 -k3,3M -k4,4 -k5,5 | cut -f 1); do atq | grep -P "^$j\t"; at -c "$j" | tail -n 2; done'

# nixos
alias nxor="sudo nixos-rebuild"

# nix-shell
alias nz='nxz'
alias nzp='nxz -p'

# nnn
alias n='nnn'

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
alias ptpy='tmux rename-window "py"; pp'

# ripgrep
alias rgs='rg --case-sensitive'

# todo.sh
alias t="todo.sh"

# wtwitch
alias tw='wtwitch'
alias tw_online="wtwitch c | sed '/^ Offline:\$/,\$d'"
alias tw_watch="tw_online | grep '^  ' | fzf --ansi | sed 's/^   \\([^:]\\+\\).*/\\1/' | xargs wtwitch watch"
alias twc='tw_online'
alias tws='wtwitch sub'
alias tww='tw_watch'




### PACKAGE MANAGEMENT ###

# Pacman
alias sp='sudo pacman'
alias sps='sudo pacman -S'

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

# Homebrew
alias bi='brew install'
alias bic='brew install --cask'




### MISCELLANEOUS ###

# emoji
alias lenny='emoji -lc'
alias shruggie='emoji -sc'




### FILE PATHS ###

# File common
alias todo='vim ~/Dropbox/misc/notepad/todo-txt/todo.txt'

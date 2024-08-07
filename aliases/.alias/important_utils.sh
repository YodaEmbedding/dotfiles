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

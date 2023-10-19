# INITIAL {{{1
# If not running interactively, don't do anything
[[ -o interactive ]] || return


# ZINIT {{{1

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
    print -P "%F{33} %F{34}Installation successful.%f%b" || \
    print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
  zdharma-continuum/zinit-annex-as-monitor \
  zdharma-continuum/zinit-annex-bin-gem-node \
  zdharma-continuum/zinit-annex-patch-dl \
  zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk


# PLUGINS {{{1

# light-mode: disable stats tracking
# wait: load 0s (about 5ms exactly) after prompt; aka "Turbo mode"
# lucid: silence "loaded plugin" messages
# atinit'': execute code before loading plugin
# atload'': execute code after loading plugin
# blockf: disallow plugin to modify fpath; useful for completions

zinit for \
    OMZL::git.zsh \
    OMZL::history.zsh

OMZ_VI_MODE=0

if [[ $OMZ_VI_MODE -eq 1 ]]; then
  zinit for OMZP::vi-mode
  autoload edit-command-line
  zle -N edit-command-line
else
  zvm_config() {
    ZVM_CURSOR_STYLE_ENABLED=false
    ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  }
  zinit light-mode for jeffreytse/zsh-vi-mode
fi

zinit light-mode wait lucid for \
  \
    OMZP::fzf \
    Aloxaf/fzf-tab \
    MichaelAquilina/zsh-you-should-use \
  atload"bind_keys" \
    mollifier/anyframe \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start; bind_keys_zsh_autosuggestions" \
    zsh-users/zsh-autosuggestions \
  blockf atpull"zinit creinstall -q ." \
    zsh-users/zsh-completions


# SOURCING {{{1

[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.profile ] && source ~/.profile
[ -e ~/.dircolors ] && eval $(dircolors -b ~/.dircolors) || eval $(dircolors -b)

export _FASD_MAX=100000
eval "$(fasd --init zsh-hook)"

export _ZO_MAXAGE=100000
export _ZO_RESOLVE_SYMLINKS=1
eval "$(zoxide init zsh)"


# THEME {{{1

setopt promptsubst

PROMPT_SYMBOL="${PROMPT_SYMBOL:-λ}"
PROMPT_BGCOLOR="${PROMPT_BGCOLOR:-96}"
PROMPT_FGCOLOR="${PROMPT_FGCOLOR:-217}"

make_prompt() {
  local PROMPT_BGCOLOR="$1"
  local PROMPT_FGCOLOR="$2"
  local s=""

  # · 00:00:00 · ~/pwd · (master)
  s+=$'\n'
  s+="%}%K{$PROMPT_BGCOLOR}%F{$PROMPT_FGCOLOR}%B"
  s+='· %D{%H:%M:%S} '
  s+='· %~ '
  s+='$([[ -z "$PROMPT_NAME" ]] || echo "· ($PROMPT_NAME) ")'
  s+='$(out=$(git_prompt_info); [ -z "$out" ] || echo "· ($out) ")'
  s+='%b%f%k'

  # λ
  s+=$'\n'
  s+='%(?.%F{magenta}.%F{red})'
  s+="$PROMPT_SYMBOL"
  s+='%f '

  echo "$s"
}

PS1="$(make_prompt $PROMPT_BGCOLOR $PROMPT_FGCOLOR)"
PS2="> "
RPROMPT='%{$reset_color%}'

list_colors_bg() {
  for ((i = 0; i < 256; i++)); do
    echo "$(tput setab $i)$(tput setaf 4)$(tput bold) $i $(tput sgr0)"
  done
}

list_prompts_bg() {
  for ((i = 0; i < 256; i++)); do
    print -P "$(make_prompt $i $PROMPT_FGCOLOR)$i"
  done
}

list_prompts_fg() {
  for ((i = 0; i < 256; i++)); do
    print -P "$(make_prompt $PROMPT_BGCOLOR $i)$i"
  done
}


# MISCELLANEOUS CONFIGURATIONS {{{1

# History sizes
HISTSIZE=20000000
SAVEHIST=10000000

# Do not save certain commands to history
HISTORY_IGNORE="(kill <->|kill -<-> <->)"

# Do not save to history commands prefixed wtih space
setopt hist_ignore_space

# Remove duplicate commands from history on exit
setopt hist_ignore_all_dups
setopt hist_save_no_dups

# Better globbing
setopt extended_glob
setopt globdots
setopt nullglob

# Plugin: anyframe
zstyle ":anyframe:selector:" use fzf

# Use LS COLORS to autocomplete
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


# FUNCTIONS {{{1

anyframe-widget-cd() {
  local dirs=$(find . -mindepth 1 -maxdepth 1 -type d,l -printf '%f\0' | sort)
  [[ -z $dirs ]] && return
  local item=$(
    printf '%s\0%s\0%s' "$PWD" ".." "$dirs" |
      fzf \
        --read0 \
        --preview="tree -C -L 1 {} | head -n 80" \
        --preview-window=bottom:70% \
        --bind "/:accept" \
        --bind "pgup:preview-up" \
        --bind "pgdn:preview-down" \
        --bind "ctrl-h:clear-query+pos(2)+accept" \
        --bind "ctrl-l:accept"
  )
  [[ -z $item ]] && return
  cd "$item"
  _reset-prompt
  anyframe-widget-cd
}

anyframe-widget-frece() {
  local DB_FILE="$HOME/.local/share/frece/dir.db"
  local item=$(frece print "$DB_FILE" | anyframe-selector-auto)
  [[ -z $item ]] && return
  frece increment "$DB_FILE" "$item"
  # echo "$item" | anyframe-action-execute cd --
  cd "$item"
  _reset-prompt
}

zi_all() {
  builtin local result
  result="$(zoxide query --interactive --all -- "$@")"  && __zoxide_cd "${result}"
}

zoxide-widget() {
  zi_all
  _reset-prompt
}

_reset-prompt() {
  zle .reset-prompt
}


# WIDGETS {{{1

zle -N -- anyframe-widget-cd
zle -N -- anyframe-widget-frece
zle -N -- zoxide-widget


# KEYBINDINGS {{{1

# Use showkey -a to detect terminal keycodes

bindkey '^p' up-history                                   # up/down history
bindkey '^n' down-history                                 # up/down history
bindkey "^[[5~" up-history                                # up/down history
bindkey "^[[6~" down-history                              # up/down history

if [[ $OMZ_VI_MODE -eq 1 ]]; then
  bindkey -v                                              # vim
  bindkey -v '^?' backward-delete-char                    # vim backspace
  bindkey -M vicmd V edit-command-line                    # vim edit command
  bindkey -M vicmd '^[[3~' ''                             # vim disable DEL key
  bindkey -M vicmd "^[[5~" up-history                     # vim page up
  bindkey -M vicmd "^[[6~" down-history                   # vim page down
fi

bindkey '^w' forward-word                                 # move forward word

bind_keys() {
  bindkey '^a' anyframe-widget-cd                         # cd
  bindkey '^f' anyframe-widget-frece                      # frece
  bindkey '^k' anyframe-widget-kill                       # kill
  bindkey '^z' zoxide-widget                              # cd
  bindkey -s '^o' 'lfcd\n'                                # lf
}

bind_keys_zsh_autosuggestions() {
  bindkey '^ ' autosuggest-accept                         # Fill suggestion
  bindkey '^t' autosuggest-accept                         # Fill suggestion
  bindkey '^[^M' autosuggest-execute                      # Fill and run suggestion
}

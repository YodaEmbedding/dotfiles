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

zinit snippet OMZL::git.zsh
zinit snippet OMZL::history.zsh
# zinit snippet OMZP::vi-mode

zvm_config() {
  ZVM_CURSOR_STYLE_ENABLED=false
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
}
zinit light jeffreytse/zsh-vi-mode

bind_keys() {
    bindkey '^f' anyframe-widget-frece                      # frece
    bindkey '^k' anyframe-widget-kill                       # kill
    bindkey '^v' fzf-fasdvim-widget                         # vim
    bindkey '^z' zoxide-widget                              # cd
    bindkey '^a' zoxide-widget                              # cd
    bindkey -s '^o' 'lfcd\n'                                # lf
}

zinit wait lucid light-mode for \
  atload"bind_keys" \
    mollifier/anyframe \
  \
    OMZP::fzf \
    Aloxaf/fzf-tab \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start; bindkey '^[^M' autosuggest-execute" \
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

# vim edit-command-line
# autoload edit-command-line
# zle -N edit-command-line


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

# Plugin: anyframe
zstyle ":anyframe:selector:" use fzf

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

# Use LS COLORS to autocomplete
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


# FUNCTIONS {{{1

# anyframe {{{2
anyframe-widget-fasd() {
    fasd -Rdl "$LBUFFER" \
        | anyframe-selector-auto \
        | anyframe-action-execute cd --
}

anyframe-widget-frece() {
    local DB_FILE="$HOME/.frece/db/dir.db"
    local item=$(frece print "$DB_FILE" | anyframe-selector-auto)
    [[ -z $item ]] && return
    frece increment "$DB_FILE" "$item"
    echo "$item" | anyframe-action-execute cd --
}

# fzf {{{2
run_fzf() {
    setopt localoptions noglobsubst noposixbuiltins pipefail 2> /dev/null
    local bind_key="$1"
    local src_cmd="$2"
    local fzf_opts="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.."
    fzf_opts+=" --tiebreak=index --bind=${bind_key}:toggle-sort"
    fzf_opts+=" $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m"
    local selected=( $(eval "$src_cmd" | FZF_DEFAULT_OPTS="$fzf_opts" $(__fzfcmd)) )
    local ret=$?
    if [ -n "$selected" ]; then
        local item="${selected[@]:1}"
        if [ -n "$item" ]; then
            echo "$item"
        fi
    fi
    return $ret
}

fzf-fasddir-widget() {
    local item="$(run_fzf 'ctrl-z' 'fasd -Rd')"
    local ret=$?
    cd "$item"
    zle reset-prompt
    return ret
}

fzf-fasdfile-widget() {
    local item="$(run_fzf 'ctrl-f' 'fasd -R')"
    local ret=$?
    LBUFFER="${LBUFFER}${item}"
    zle reset-prompt
    return ret
}

fzf-fasdvim-widget() {
    local item="$(run_fzf 'ctrl-v' 'fasd -R')"
    local ret=$?
    if [ -n "$item" ]; then
        LBUFFER="vim "
        RBUFFER="$item"
        zle reset-prompt
        zle accept-line
    fi
    return ret
}

zi() {
  \builtin local result
  result="$(zoxide query -i --all -- "$@")"  && __zoxide_cd "${result}"
}

zoxide-widget() {
    zi
    zle reset-prompt
}


# WIDGETS {{{1

zle -N -- anyframe-widget-fasd
zle -N -- anyframe-widget-frece
zle -N -- fzf-fasddir-widget
zle -N -- fzf-fasdfile-widget
zle -N -- fzf-fasdvim-widget
zle -N -- zoxide-widget


# KEYBINDINGS {{{1

# Use showkey -a to detect terminal keycodes

bindkey '^p' up-history                                   # up/down history
bindkey '^n' down-history                                 # up/down history
bindkey "^[[5~" up-history                                # up/down history
bindkey "^[[6~" down-history                              # up/down history

# bindkey -v                                              # vim
# bindkey -v '^?' backward-delete-char                    # vim backspace
# bindkey -M vicmd V edit-command-line                    # vim edit command
# bindkey -M vicmd '^[[3~' ''                             # vim disable DEL key
# bindkey -M vicmd "^[[5~" up-history                     # vim page up
# bindkey -M vicmd "^[[6~" down-history                   # vim page down

# NOTE: These are bound above.
# bindkey '^ '   autosuggest-accept                       # Fill suggestion
# bindkey '^[^M' autosuggest-execute                      # Fill and run suggestion

# NOTE: These are bound above.
# bindkey '^f' anyframe-widget-frece                      # frece
# bindkey '^k' anyframe-widget-kill                       # kill
# bindkey '^v' fzf-fasdvim-widget                         # vim
# bindkey '^z' zoxide-widget                              # cd
# bindkey -s '^o' 'lfcd\n'                                # lf

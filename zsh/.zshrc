# INITIAL {{{1
# If not running interactively, don't do anything
[[ -o interactive ]] || return

# ZINIT {{{1

### Added by Zinit's installer

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

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

zinit wait lucid light-mode for \
  atload"
    bindkey '^b' anyframe-widget-cdr
    bindkey '^f' anyframe-widget-frece
    bindkey '^k' anyframe-widget-kill
  " \
    mollifier/anyframe

zinit wait lucid light-mode for \
    OMZP::fzf \
    Aloxaf/fzf-tab \

zinit wait lucid light-mode for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" \
    zdharma/fast-syntax-highlighting

zinit wait lucid light-mode for \
  atload"_zsh_autosuggest_start; bindkey '^[^M' autosuggest-execute" \
    zsh-users/zsh-autosuggestions

zinit wait lucid light-mode for \
  blockf \
    zsh-users/zsh-completions

zinit wait lucid light-mode for \
  atinit"
    forgit_diff=gdf
    forgit_checkout_commit=gcl
  " \
    wfxr/forgit

# zinit wait lucid light-mode for \
#   atinit"
#     zstyle ':autocomplete:*' insert-unambiguous yes;
#     zstyle ':autocomplete:*' list-lines 8;
#   " \
#     marlonrichert/zsh-autocomplete

# SOURCING {{{1

# Aliases
[ -f ~/.aliases ] && source ~/.aliases

# Profile
[ -f ~/.profile ] && source ~/.profile

# ls colors
[ -e ~/.dircolors ] && eval $(dircolors -b ~/.dircolors) || eval $(dircolors -b)

# vim edit-command-line
# autoload edit-command-line
# zle -N edit-command-line

# cdr (for searching/jumping to frequent directories using anyframe-widget-cdr)
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# fasd
export _FASD_MAX=100000
eval "$(fasd --init zsh-hook)"

# pyenv
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

# zoxide
eval "$(zoxide init zsh)"

# THEME {{{1

setopt promptsubst

# for ((i=0;i<256;i++)); do echo "$(tput setab $i)$(tput setaf 4)$(tput bold)$i$(tput sgr0)"; done

[[ ! -z  "$PROMPT_NAME" ]] && PROMPT_NAME="· $PROMPT_NAME "

PURE_PROMPT_SYMBOL=λ

PS1=$'\n'
PS1+="%}%K{96}%F{217}%B"
PS1+='· %D{%H:%M:%S} '
PS1+="$PROMPT_NAME"
PS1+='· %~ '
PS1+='$(out=$(git_prompt_info); [ -z "$out" ] || echo "· ($out) ")'
PS1+="%b%f%k"
PS1+=$'\n'
PS1+="%(?.%F{magenta}.%F{red})"
PS1+="$PURE_PROMPT_SYMBOL"
PS1+="%f "

PS2="> "

RPROMPT='%{$reset_color%}'

# Title
case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

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

# Style
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
# bindkey '^b' anyframe-widget-cdr                        # List and jump to frequent directories
# bindkey '^f' anyframe-widget-frece                      #
# bindkey '^k' anyframe-widget-kill                       # Kill process

bindkey '^v' fzf-fasdvim-widget                         #

bindkey '^z' zoxide-widget                              # cd to folder using zoxide

bindkey -s '^o' 'lfcd\n'

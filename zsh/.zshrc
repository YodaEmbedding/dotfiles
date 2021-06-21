# INITIAL {{{1
# If not running interactively, don't do anything
[[ -o interactive ]] || return


# ZPLUG {{{1

source ~/.zplug/init.zsh

zp() {
    zplug "$1$2", "${@:3}"
}

# PLUGINS {{{2

# ENABLED {{{3
zp "lib/"         "completion"          from:oh-my-zsh      # Command completion
zp "lib/"         "git"                 from:oh-my-zsh      # Prompt
zp "lib/"         "history"             from:oh-my-zsh      #
zp "lib/"         "vi-mode"             from:oh-my-zsh      #
zp "mollifier/"   "anyframe"                                # Fuzzy keybinds
zp "zsh-users/"   "zsh-autosuggestions"                     # Fish-like

# LOAD {{{2
# Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
# 	zplug install
# fi

# Consider updating
# zplug update

# Source plugins and add commands to $PATH
zplug load

# SOURCING {{{1

# GNU Parallel
source $(which env_parallel.zsh)
env_parallel --session

# Aliases
[ -f ~/.aliases ] && source ~/.aliases

# Profile
[ -f ~/.profile ] && source ~/.profile

# Fish-like autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ls colors
[ -e ~/.dircolors ] && eval $(dircolors -b ~/.dircolors) || eval $(dircolors -b)

# vim edit-command-line
autoload edit-command-line
zle -N edit-command-line

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
    local DB_FILE="$HOME/.frece_dir.db"
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

# WIDGETS {{{1

zle -N -- anyframe-widget-fasd
zle -N -- anyframe-widget-frece
zle -N -- fzf-fasddir-widget
zle -N -- fzf-fasdfile-widget
zle -N -- fzf-fasdvim-widget

# KEYBINDINGS {{{1

# Use showkey -a to detect terminal keycodes

bindkey -v                                              # vim
bindkey -v '^?' backward-delete-char                    # vim backspace
bindkey -M vicmd V edit-command-line                    # vim edit command
bindkey -M vicmd '^[[3~' ''                             # vim disable DEL key
bindkey -M vicmd "^[[5~" up-history                     # vim page up
bindkey -M vicmd "^[[6~" down-history                   # vim page down

bindkey '^ '   autosuggest-accept                       # Fill suggestion
bindkey '^[^M' autosuggest-execute                      # Fill and run suggestion

bindkey '^b' anyframe-widget-cdr                        # List and jump to frequent directories
bindkey '^f' fzf-fasdfile-widget                        #
bindkey '^k' anyframe-widget-kill                       # Kill process
bindkey '^v' fzf-fasdvim-widget                         #
bindkey '^z' fzf-fasddir-widget                         # cd to folder using fasd

bindkey -s '^o' 'lfcd\n'

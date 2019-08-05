# Installation: Please install zplug then simply copy this to ~/.zshrc
# Author: Mateen Ulhaq <mulhaq2005@gmail.com>

# INITIAL {{{1
# If not running interactively, don't do anything
[[ -o interactive ]] || return


# ZPLUG {{{1

source ~/.zplug/init.zsh

# PLUGINS {{{2

# ENABLED {{{3
zplug $(printf "%s%s" "lib/"         "completion"),        from:oh-my-zsh       # Suggests command completions
zplug $(printf "%s%s" "lib/"         "git"),               from:oh-my-zsh       # Prompt
zplug $(printf "%s%s" "lib/"         "history"),           from:oh-my-zsh       #
zplug $(printf "%s%s" "lib/"         "vi-mode"),           from:oh-my-zsh       #
zplug $(printf "%s%s" "mollifier/"   "anyframe")                                # Bindings for fuzzy commands
zplug $(printf "%s%s" "plugins/"     "colored-man-pages"), from:oh-my-zsh       # Easier to read man pages

# DISABLED {{{3
#zplug $(printf "%s%s" "changyuheng/" "fz"),                defer:1              # Fuzzy tab completion for z
#zplug $(printf "%s%s" "lib/"         "clipboard"),         from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
#zplug $(printf "%s%s" "lib/"         "colorize"),          from:oh-my-zsh       # Syntax highlight cat output
#zplug $(printf "%s%s" "lib/"         "key-bindings"),      from:oh-my-zsh       # Useful keybindings
#zplug $(printf "%s%s" "lib/"         "python"),            from:oh-my-zsh       #
#zplug $(printf "%s%s" "lib/"         "themes"),            from:oh-my-zsh       #
#zplug $(printf "%s%s" "mafredri/"    "zsh-async"),         defer:0              #
#zplug $(printf "%s%s" "rupa/"        "z"),                 use:'*.sh'           # Navigate to most used directories
#zplug $(printf "%s%s" "urbainvaes/"  "fzf-marks")                               #
#zplug $(printf "%s%s" "zsh-users/"   "zsh-autosuggestions")                     #
#zplug $(printf "%s%s" "zsh-users/"   "zsh-completions")                         #
#zplug $(printf "%s%s" "zsh-users/"   "zsh-history-substring-search"), defer:3   #
#zplug $(printf "%s%s" "zsh-users/"   "zsh-syntax-highlighting"),      defer:3   #

# THEMES {{{2
#zplug $(printf "%s%s" "agnoster/"     "agnoster-zsh-theme"),   as:theme, from:oh-my-zsh
#zplug $(printf "%s%s" "halfo/"        "lambda-mod-zsh-theme"), as:theme
#zplug $(printf "%s%s" "inanimate/"    "darkblood-modular"),    as:theme
#zplug $(printf "%s%s" "marszall87/"   "lambda-pure"),          as:theme, use:lambda-pure.zsh
#zplug $(printf "%s%s" "sindresorhus/" "pure"),                 as:theme, use:pure.zsh

# PLUGIN CONFIGURATION {{{2
PURE_PROMPT_SYMBOL=λ
_Z_CMD=j

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
eval "$(fasd --init posix-alias zsh-hook)"

# Rename files using zmv 'test(*).png' '$1.png'
# autoload zmv

# THEME {{{1

setopt promptsubst

# 54  , blue
# blue, 178
# 169 , 190
# 59  , 217
# 60  , 217
# 96  , 217
# 234 , 217
# for ((i=0;i<256;i++)); do echo "$(tput setab $i)$(tput setaf 4)$(tput bold)$i$(tput sgr0)"; done

[[ ! -z  "$PROMPT_NAME" ]] && PROMPT_NAME="· $PROMPT_NAME "

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
HISTSIZE=2000000
SAVEHIST=1000000

# Do not save common commands to history
# HISTORY_IGNORE="(ls|lsl|cd|cd ..|..|pwd|exit|vimrc|zshrc|i3config|gst|gd)"
HISTORY_IGNORE="(kill <->|kill -<-> <->)"

# Do not save to history commands prefixed wtih space
setopt hist_ignore_space

# Remove duplicate commands from history on exit
setopt hist_ignore_all_dups
setopt hist_save_no_dups

# Better globbing
setopt extended_glob

# Style
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}  # Use LS COLORS to autocomplete

# FUNCTIONS {{{1

# Copy paths {{{2

# Copy directory path
cpdp() { pwd | xargs echo -n | pbcopy }

# Copy file path
cpfp() { echo -n "$PWD/$@" | pbcopy }

# Paste from file path
pfp() { cp "$(pbpaste)" . }

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
    # LBUFFER="vim"
    # RBUFFER=" ${item}"
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

# Run process in background {{{2
# https://stackoverflow.com/questions/10408816/how-do-i-use-the-nohup-command-without-getting-nohup-out
bgrnd() {
	nohup "$@" </dev/null >/dev/null 2>&1 &
	disown
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

bindkey '^ '   autosuggest-accept                       # Fill suggestion
bindkey '^[^M' autosuggest-execute                      # Fill and run suggestion

#bindkey '^?' backward-delete-char                      # Backspace (doesn't work after hitting <esc>i)

bindkey '^b' anyframe-widget-cdr                        # List and jump to frequent directories
bindkey '^f' fzf-fasdfile-widget                        # 
bindkey '^k' anyframe-widget-kill                       # Kill process
bindkey '^v' fzf-fasdvim-widget                         # 
bindkey '^z' fzf-fasddir-widget                         # cd to folder using fasd
#bindkey '^f' anyframe-widget-insert-filename           #
#bindkey '^f' anyframe-widget-frece                     # cd to folder using frece
#bindkey '^r' anyframe-widget-put-history               # Recall history command
#bindkey '^z' anyframe-widget-fasd                      # cd to folder using fasd
#bindkey '^x^b' anyframe-widget-checkout-git-branch     #
#bindkey '^xe'  anyframe-widget-insert-git-branch       #
#bindkey '^-r' percol_select_history                    #
#bindkey '^-b' percol_select_marks                      #

# TODO {{{1

# Use Ctrl+Enter to fill fish command then execute

# fasd (similar to autojump but with shell commands): https://github.com/clvv/fasd
# Update plugins every N days

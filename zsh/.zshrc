# Installation: Please install zplug then simply copy this to ~/.zshrc
# Author: Mateen Ulhaq <mulhaq2005@gmail.com>

# INITIAL {{{1
# If not running interactively, don't do anything
[[ -o interactive ]] || return


# ZPLUG {{{1

source ~/.zplug/init.zsh

# PLUGINS {{{2
#zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
#zplug "lib/colorize", from:oh-my-zsh                       # Syntax highlight cat output
zplug "lib/completion", from:oh-my-zsh                      # Suggests command completions
#zplug "lib/git", from:oh-my-zsh                            #
zplug "lib/history", from:oh-my-zsh                         #
zplug "lib/key-bindings", from:oh-my-zsh                    # Useful keybindings
#zplug "lib/python", from:oh-my-zsh                         #
#zplug "lib/themes", from:oh-my-zsh                         #
zplug "lib/vi-mode", from:oh-my-zsh                         #
zplug "mafredri/zsh-async", defer:0                         #
zplug "mollifier/anyframe"                                  # Bindings for fuzzy commands
zplug 'rupa/z', use:'*.sh'                                  # Navigate to most used directories
#zplug "urbainvaes/fzf-marks"                               #
#zplug "zsh-users/zsh-autosuggestions"                      #
#zplug "zsh-users/zsh-completions"                          #
#zplug "zsh-users/zsh-history-substring-search", defer:3    #
#zplug "zsh-users/zsh-syntax-highlighting", defer:3         #

# THEMES {{{2
#zplug "agnoster/agnoster-zsh-theme", from:oh-my-zsh, as:theme
#zplug "halfo/lambda-mod-zsh-theme", as:theme
#zplug "inanimate/darkblood-modular", as:theme
#zplug "marszall87/lambda-pure", use:lambda-pure.zsh, as:theme
zplug "sindresorhus/pure", use:pure.zsh, as:theme

# PLUGIN CONFIGURATION {{{2
PURE_PROMPT_SYMBOL=λ
_Z_CMD=j

# LOAD {{{2
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
	zplug install
fi

# Consider updating
# zplug update

# Source plugins and add commands to $PATH
zplug load

# SOURCING {{{1

# Aliases
[ -f ~/.aliases ] && source ~/.aliases

# Fish-like autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ls colors
[ -e ~/.dircolors ] && eval $(dircolors -b ~/.dircolors) || eval $(dircolors -b)

# cdr (for searching/jumping to frequent directories using anyframe-widget-cdr)
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# Rename files using zmv 'test(*).png' '$1.png'
autoload zmv

# MISCELLANEOUS CONFIGURATIONS {{{1

# History sizes
HISTSIZE=20000
SAVEHIST=10000

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

# KEYBINDINGS {{{1

# Use showkey -a to detect terminal keycodes

bindkey -v                                              # vim

bindkey '^ '   autosuggest-accept                       # Fill suggestion
bindkey '^[^M' autosuggest-execute                      # Fill and run suggestion

#bindkey '^?' backward-delete-char                      # Backspace (doesn't work after hitting <esc>i)

bindkey '^b' anyframe-widget-cdr                        # List and jump to frequent directories
bindkey '^f' anyframe-widget-insert-filename            #
bindkey '^k' anyframe-widget-kill                       # Kill process
bindkey '^r' anyframe-widget-put-history                # Recall history command
#bindkey '^x^b' anyframe-widget-checkout-git-branch     #
#bindkey '^r'   anyframe-widget-execute-history         # Execute history command
#bindkey '^xe'  anyframe-widget-insert-git-branch       #

#bindkey '^-r' percol_select_history                    #
#bindkey '^-b' percol_select_marks                      #

# FUNCTIONS {{{1

# Echo path to file
pwdf() { echo "$PWD/$@" }

# NOTE This isn't actually really needed because of $OLDPWD
# Save path to working directory
spwd() { s=$PWD }

# Save path to file
spwdf() { s=$(pwdf) }

# Run process in background
# https://stackoverflow.com/questions/10408816/how-do-i-use-the-nohup-command-without-getting-nohup-out
bgrnd() {
	nohup "$@" </dev/null >/dev/null 2>&1 &
	disown
}

# TODO {{{1

# Use Ctrl+Enter to fill fish command then execute

# fasd (similar to autojump but with shell commands): https://github.com/clvv/fasd
# Update plugins every N days


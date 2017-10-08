# Installation: Please install zplug then simply copy this to ~/.zshrc
# Author: Mateen Ulhaq <mulhaq2005@gmail.com>

# If not running interactively, don't do anything
[[ -o interactive ]] || return
#[[ -o login ]] && return


# SECTION: ZPLUG

source ~/.zplug/init.zsh

# PLUGINS
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

# TODO fuzzy searching fzf, peco, percol, ...

#zplug "junegunn/fzf-bin", \
#    from:gh-r, \
#    at:0.11.0, \
#    as:command, \
#    use:"*darwin*amd64*", \
#    rename-to:fzf

# THEMES
#zplug "agnoster/agnoster-zsh-theme", from:oh-my-zsh, as:theme
#zplug "halfo/lambda-mod-zsh-theme", as:theme
#zplug "inanimate/darkblood-modular", as:theme
#zplug "marszall87/lambda-pure", use:lambda-pure.zsh, as:theme
zplug "sindresorhus/pure", use:pure.zsh, as:theme

# PLUGIN CONFIGURATION
PURE_PROMPT_SYMBOL=λ
#PROMPT="%(?.%F{yellow}.%F{red})${PURE_PROMPT_SYMBOL:-λ}%f "
_Z_CMD=j

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
	zplug install

	#printf "Install? [y/N]: "
	#if read -q; then
		#echo; zplug install
	#fi
fi

# Consider updating
# zplug update

# Source plugins and add commands to $PATH
zplug load


# SECTION: SOURCE

[ -f ~/.aliases ] && source ~/.aliases
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash  # Fuzzy file finder
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh  # Fuzzy file finder
#source /etc/profile.d/autojump.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ls colors
[ -e ~/.dircolors ] && eval $(dircolors -b ~/.dircolors) || eval $(dircolors -b)

# cdr (for searching/jumping to frequent directories using anyframe-widget-cdr)
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# Rename files using zmv 'test(*).png' '$1.png'
autoload zmv

# SECTION: MISCELLANEOUS CONFIGURATIONS

# Terminal options
setopt extendedglob
#setopt kshglob

# Style
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}  # Use LS COLORS to autocomplete

# Keybindings
bindkey -v                                              # vim
#bindkey '^?' backward-delete-char                      # backspace (doesn't work after hitting <esc>i)
bindkey '^ ' autosuggest-accept                         #
#bindkey '^-r' percol_select_history                    #
#bindkey '^-b' percol_select_marks                      #
bindkey '^b' anyframe-widget-cdr                        # List and jump to frequent directories
#bindkey '^x^b' anyframe-widget-checkout-git-branch     #
#bindkey '^r' anyframe-widget-execute-history           # Execute history command
bindkey '^f' anyframe-widget-insert-filename
#bindkey '^xe' anyframe-widget-insert-git-branch        #
bindkey '^k' anyframe-widget-kill                       # Kill process
bindkey '^r' anyframe-widget-put-history                # Recall history command


# SECTION: CUSTOM FUNCTIONS

# cd then ls
cdd() { cd "$@" && ls; }

# mv then cd then ls
mvv() { mv "$@" && cdd "$2"; }

# Echo path to file
fpwd() { echo "$PWD/$@" }

# Run process in background
# https://stackoverflow.com/questions/10408816/how-do-i-use-the-nohup-command-without-getting-nohup-out
bgrnd() {
	nohup "$@" </dev/null >/dev/null 2>&1 &
	disown
}

# xopen() {
#     bgrnd xdg-open "$@"
# }

# redshift
# rs() { echo "$1" > ~/.rshift && redshift -O "$1"; }

# TODO

# fasd (similar to autojump but with shell commands): https://github.com/clvv/fasd


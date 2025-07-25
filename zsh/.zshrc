OMZ_VI_MODE=0


setup_init() {
  [[ -o login ]] || (
    # Is non-login shell. (i.e., ~/.zprofile is not automatically sourced)
    # Ensure that we source it anyways:
    # [ -f ~/.zprofile ] && source ~/.zprofile
  )

  # Always source ~/.profile (idempotent). (It may not be sourced by ~/.zprofile.)
  [ -f ~/.profile ] && source ~/.profile
}


load_zinit() {
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
}


load_zinit_plugins() {
  # light-mode: disable stats tracking
  # wait: load 0s (about 5ms exactly) after prompt; aka "Turbo mode"
  # lucid: silence "loaded plugin" messages
  # atinit'': execute code before loading plugin
  # atload'': execute code after loading plugin
  # blockf: disallow plugin to modify fpath; useful for completions

  # Fix:
  # https://github.com/ohmyzsh/ohmyzsh#disable-async-git-prompt
  zstyle ':omz:alpha:lib:git' async-prompt no

  zinit for \
      OMZL::git.zsh \
      OMZL::history.zsh

  if [[ $OMZ_VI_MODE -eq 1 ]]; then
    zinit for OMZP::vi-mode
    autoload edit-command-line
    zle -N edit-command-line
  else
    zvm_config() {
      ZVM_CURSOR_STYLE_ENABLED=false
      ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
    }
    zvm_after_init_commands=(
      "zvm_bindkey vicmd '^R' redo"
      "zvm_bindkey viins '^W' forward-word"
    )
    zinit light-mode for jeffreytse/zsh-vi-mode
  fi

  zinit light-mode wait lucid for \
    \
      OMZP::fzf \
      Aloxaf/fzf-tab \
      MichaelAquilina/zsh-you-should-use \
    atload"bind_keys_anyframe" \
      mollifier/anyframe \
    atinit"setup_completion" \
      zdharma-continuum/fast-syntax-highlighting \
    atload"_zsh_autosuggest_start; bind_keys_zsh_autosuggestions" \
      zsh-users/zsh-autosuggestions \
    blockf atpull"zinit creinstall -q ." \
      zsh-users/zsh-completions

  # zinit light-mode wait lucid for wfxr/forgit
}


setup_completion() {
  ZINIT[COMPINIT_OPTS]=-C
  zicompinit
  zicdreplay
  eval "$(ruff generate-shell-completion zsh)"
  eval "$(uv generate-shell-completion zsh)"
  eval "$(zoxide init zsh)"

  # Workaround
  # https://github.com/astral-sh/uv/issues/8432#issuecomment-2605216865
  _uv_override() {
    local flagless_words=()

    for word in "${words[@]}"; do
      if [[ "$word" != --* ]]; then
        flagless_words+=("$word")
      fi
    done

    local command_word="${flagless_words[2]}"

    if [[ "$command_word" == "run" && "$words[CURRENT]" != -* ]]; then
      local venv_binaries
      if [[ -d .venv/bin ]]; then
        venv_binaries=( ${(@f)"$(_call_program files ls -1 .venv/bin 2>/dev/null)"} )
      fi
      _alternative \
        'files:filename:_files' \
        "binaries:venv binary:(($venv_binaries))"
    else
      _uv "$@"
    fi
  }

  compdef _uv_override uv
}


source_files() {
  [ -f ~/.aliases ] && source ~/.aliases
  [ -e ~/.dircolors ] && eval $(dircolors -b ~/.dircolors) || eval $(dircolors -b)
}


setup_theme() {
  setopt promptsubst

  PROMPT_SYMBOL="${PROMPT_SYMBOL:-λ}"
  PROMPT_BGCOLOR="${PROMPT_BGCOLOR:-96}"
  PROMPT_FGCOLOR="${PROMPT_FGCOLOR:-217}"

  HOSTNAME="${HOSTNAME:-$(hostname)}"
  WHOAMI="${WHOAMI:-$(whoami)}"

  PS1="$(make_prompt $PROMPT_BGCOLOR $PROMPT_FGCOLOR)"
  PS2="> "
  RPROMPT='%{$reset_color%}'
}

make_prompt() {
  local PROMPT_BGCOLOR="$1"
  local PROMPT_FGCOLOR="$2"
  local PROMPT_DATE_FORMAT="%m-%d %H:%M:%S"
  local s=""

  # · 01-01 00:00:00 · ~/pwd · (PROMPT_NAME) · (master) · [user@hostname]
  s+=$'\n'
  s+="%}%K{$PROMPT_BGCOLOR}%F{$PROMPT_FGCOLOR}%B"
  s+="· %D{$PROMPT_DATE_FORMAT} "
  s+='· %~ '
  s+='$([[ -z "$PROMPT_NAME" ]] || echo "· ($PROMPT_NAME) ")'
  s+='$(out=$(git_current_branch); [ -z "$out" ] || echo "· ($out) ")'
  s+='$(out=$SLURM_JOB_ID; [ -z "$out" ] || echo "· ($WHOAMI@$HOSTNAME) ")'
  s+='%b%f%k'

  # λ
  s+=$'\n'
  s+='%(?.%F{magenta}.%F{red})'
  s+="$PROMPT_SYMBOL"
  s+='%f '

  echo "$s"
}

list_colors_bg() {
  for ((i = 0; i < 256; i++)); do
    echo "$(tput setab $i)$(tput setaf $PROMPT_FGCOLOR)$(tput bold) $i $(tput sgr0)"
  done
}

list_colors_fg() {
  for ((i = 0; i < 256; i++)); do
    echo "$(tput setab $PROMPT_BGCOLOR)$(tput setaf $i)$(tput bold) $i $(tput sgr0)"
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


setup_options() {
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

  # Allow comments (#)
  setopt interactivecomments

  # Completion after =
  setopt magic_equal_subst

  # zoxide
  export _ZO_MAXAGE=100000
  export _ZO_RESOLVE_SYMLINKS=1

  # Plugin: anyframe
  zstyle ":anyframe:selector:" use fzf

  # Use LS COLORS to autocomplete
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
}


interactive-widget-cd() {
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
  interactive-widget-cd
}

zoxide-widget() {
  builtin local result
  result="$(zoxide query --interactive --all -- "$@")"  && __zoxide_cd "${result}"
  _reset-prompt
}

_reset-prompt() {
  zle .reset-prompt
}


setup_widgets() {
  zle -N -- interactive-widget-cd
  zle -N -- zoxide-widget
}


setup_keybindings() {
  # Use showkey -a to detect terminal keycodes

  bindkey '^p' up-history                                 # up/down history
  bindkey '^n' down-history                               # up/down history
  bindkey "^[[5~" up-history                              # up/down history
  bindkey "^[[6~" down-history                            # up/down history

  if [[ $OMZ_VI_MODE -eq 1 ]]; then
    bindkey -v                                            # vim
    bindkey -v '^?' backward-delete-char                  # vim backspace
    bindkey -M vicmd V edit-command-line                  # vim edit command
    bindkey -M vicmd '^[[3~' ''                           # vim disable DEL key
    bindkey -M vicmd "^[[5~" up-history                   # vim page up
    bindkey -M vicmd "^[[6~" down-history                 # vim page down
  fi

  bindkey '^a' interactive-widget-cd                      # cd
  bindkey '^w' forward-word                               # move forward word
  bindkey '^z' zoxide-widget                              # cd
  bindkey -s '^o' 'lfcd\n'                                # lf
}

bind_keys_anyframe() {
  bindkey '^k' anyframe-widget-kill                       # kill
}

bind_keys_zsh_autosuggestions() {
  bindkey '^ ' autosuggest-accept                         # Fill suggestion
  bindkey '^t' autosuggest-accept                         # Fill suggestion
  bindkey '^[^M' autosuggest-execute                      # Fill and run suggestion
}


setup_final() {
  [[ -o login ]] || (
    # Is non-login shell. (i.e., ~/.zlogin is not automatically sourced)
    # Ensure that we source it anyways:
    # [ -f ~/.zlogin ] && source ~/.zlogin
  )
}


run_setup() {
  # If not running interactively, don't do anything
  [[ -o interactive ]] || return

  setup_init
  load_zinit
  load_zinit_plugins
  source_files
  setup_theme
  setup_options
  setup_widgets
  setup_keybindings
  setup_final
}


run_setup

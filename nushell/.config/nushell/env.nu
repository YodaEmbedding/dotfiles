# Nushell Environment Config File

def create_left_prompt [] {
    let path_segment = if (is-admin) {
        $"(ansi red_bold)($env.PWD)"
    } else {
        $"(ansi blue_bold)($env.PWD)"
    }

    let time_segment = ([
        (date now | date format '%m/%d/%Y %r')
    ] | str join)

    let git_segment = if ((do --ignore-errors { git rev-parse --is-inside-work-tree }) == "true\n") {
        $"(ansi purple_bold)\((git symbolic-ref --short HEAD)\)"
    } else {
        ""
    }

    $"\n· ($time_segment) · ($path_segment) · ($git_segment)\n "
}

def create_right_prompt [] {
    let time_segment = ([
        (date now | date format '%m/%d/%Y %r')
    ] | str join)

    $time_segment
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = { "" }

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = { "λ " }
let-env PROMPT_INDICATOR_VI_INSERT = { "λ " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "λ " }
let-env PROMPT_MULTILINE_INDICATOR = { ".. " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

# Plugins
zoxide init nushell | save -f ~/.local/share/zoxide/init.nu

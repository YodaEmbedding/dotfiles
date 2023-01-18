import warnings

warnings.filterwarnings(
    action="ignore",
    category=DeprecationWarning,
    module="prompt_toolkit.eventloop.utils",
)

# $XONSH_COLOR_STYLE = "dracula"

$PROMPT = """
{BACKGROUND_#875F87}{BOLD_#FFAFAF}· {localtime} · {PURPLE}{env_name}{BOLD_#FFAFAF} · {cwd}{BOLD_#FFAFAF} · {gitstatus}{RESET}
{BOLD_#BB93D5}λ {RESET}"""

$PROMPT_FIELDS['gitstatus'].fragments = (
    '.branch',
    '.ahead',
    '.behind',
    '.operations',
    ' {RESET} | ',
    '.staged',
    '.conflicts',
    '.changed',
    '.deleted',
    '.untracked',
    '.stash_count',
    '.lines_added',
    '.lines_removed',
    '.clean',
)
$PROMPT_FIELDS['gitstatus.branch'].prefix = "{BOLD_#FFAFAF}("
$PROMPT_FIELDS['gitstatus.branch'].suffix = ")"
$VI_MODE = True

# Plugins
xontrib load abbrevs
xontrib load fish_completer

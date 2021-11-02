from __future__ import unicode_literals
from prompt_toolkit.filters import ViInsertMode
from prompt_toolkit.key_binding.key_processor import KeyPress
from prompt_toolkit.keys import Keys
from pygments.token import Token

from ptpython.layout import CompletionVisualisation

__all__ = (
    'configure',
)

def configure(repl):
    """
    Configuration method. This is called during the start-up of ptpython.
    :param repl: `PythonRepl` instance.
    """

    # repl.confirm_exit = False
    # repl.use_code_colorscheme('monokai')
    # repl.vi_mode = True
    # repl.enable_fuzzy_completion = True
    # repl.show_signature = True
    # repl.show_docstring = True
    # repl.highlight_matching_parenthesis = True

    repl.show_signature = True
    repl.show_docstring = True
    repl.show_meta_enter_message = True
    # Show completions. (NONE, POP_UP, MULTI_COLUMN or TOOLBAR)
    # repl.completion_visualisation = CompletionVisualisation.POP_UP
    repl.completion_visualisation = CompletionVisualisation.MULTI_COLUMN
    # When CompletionVisualisation.POP_UP has been chosen, use this
    # scroll_offset in the completion menu.
    repl.completion_menu_scroll_offset = 0
    repl.show_line_numbers = False
    repl.show_status_bar = True
    repl.show_sidebar_help = True
    repl.swap_light_and_dark = False
    repl.highlight_matching_parenthesis = True
    repl.wrap_lines = True
    repl.enable_mouse_support = False
    repl.complete_while_typing = True
    repl.enable_fuzzy_completion = True
    repl.enable_dictionary_completion = False
    repl.vi_mode = True
    repl.paste_mode = False
    repl.prompt_style = "classic"
    repl.insert_blank_line_after_output = True
    repl.enable_history_search = False
    repl.enable_auto_suggest = True
    repl.enable_open_in_editor = True
    repl.enable_system_bindings = True
    repl.confirm_exit = False
    repl.enable_input_validation = True
    repl.use_code_colorscheme("monokai")
    repl.color_depth = "DEPTH_8_BIT"  # The default, 256 colors.
    # repl.color_depth = "DEPTH_24_BIT"  # True color.
    repl.min_brightness = 0.0
    repl.max_brightness = 1.0
    repl.enable_syntax_highlighting = True
    repl.vi_start_in_navigation_mode = False
    repl.vi_keep_last_used_mode = False

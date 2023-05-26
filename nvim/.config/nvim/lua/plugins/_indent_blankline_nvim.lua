return {
  config = function()
    require("indent_blankline").setup {
      char = "│",
      show_current_context = true,
      show_current_context_start = false,
      show_first_indent_level = false,
      use_treesitter = true,
    }
  end,
}

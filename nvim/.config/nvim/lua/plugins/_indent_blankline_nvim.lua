return {
  "lukas-reineke/indent-blankline.nvim",

  main = "ibl",

  opts = {
    indent = {
      char = "│",
    },
    scope = {
      enabled = true,       -- Default: true. Requires treesitter.
      show_start = false,   -- Shows an underline on the first line of the scope
      show_end = false,     -- Shows an underline on the last line of the scope
    },
  },

  config = function(_, opts)
    require("ibl").setup(opts)

    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    -- hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
  end,
}

return {
  "OXY2DEV/markview.nvim",

  enabled = false,

  dependencies = {
    -- You may not need this if you don't lazy load
    -- Or if the parsers are in your $RUNTIMEPATH
    "nvim-treesitter/nvim-treesitter",

    "nvim-tree/nvim-web-devicons",
  },

  ft = { "markdown" },

  opts = {
    code_blocks = {
      style = "simple",
      -- pad_amount = 0,
    },
    list_items = {
      indent_size = 2,
      shift_width = 2,
      marker_minus = {
        add_padding = false,
      },
      marker_plus = {
        add_padding = false,
      },
      marker_star = {
        add_padding = false,
      },
      marker_dot = {
        add_padding = false,
      },
      marker_parenthesis = {
        add_padding = false,
      },
    },
  },
}

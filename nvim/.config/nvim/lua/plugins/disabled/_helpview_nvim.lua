return {
  "OXY2DEV/helpview.nvim",

  enabled = false,

  dependencies = {
    -- You may not need this if you don't lazy load
    -- Or if the parsers are in your $RUNTIMEPATH
    "nvim-treesitter/nvim-treesitter",

    "nvim-tree/nvim-web-devicons",
  },

  lazy = false,

  -- ft = { "help" },

  opts = {
    preview = {
      icon_provider = "devicons",
    },
  },
}

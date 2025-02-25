return {
  "tzachar/local-highlight.nvim",

  dependencies = {
    "folke/snacks.nvim",
    "nvim-treesitter/nvim-treesitter",
  },

  opts = {
    disable_file_types = { "tex", "markdown" },
    hlgroup = "LocalHighlight",
    cw_hlgroup = "CWLocalHighlight",
    animate = {
      enabled = false,
    },
  },
}

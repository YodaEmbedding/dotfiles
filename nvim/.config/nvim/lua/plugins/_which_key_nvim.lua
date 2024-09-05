return {
  "folke/which-key.nvim",

  event = "VeryLazy",

  opts = {
    spec = {
      {
        "<space>g",
        group = true,
        desc = "Git",
      },
      {
        "<space>t",
        group = true,
        desc = "Trouble",
      },
      {
        "<leader>h",
        group = true,
        desc = "Gitsigns hunk",
      },
      {
        "<leader>t",
        group = true,
        desc = "Gitsigns toggle",
      },
    },
  },

  keys = require("mappings._which_key_nvim"),
}

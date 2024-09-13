return {
  "NeogitOrg/neogit",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },

  cmd = { "Neogit" },

  keys = require("mappings._neogit"),

  config = true,
}

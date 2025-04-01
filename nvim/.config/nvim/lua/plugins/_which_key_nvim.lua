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
        "<space>gd",
        group = true,
        desc = "Git diff",
      },
      {
        "<space>gh",
        group = true,
        desc = "Gitsigns hunk",
      },
      {
        "<space>gt",
        group = true,
        desc = "Gitsigns toggle",
      },
      {
        "<space>gn",
        group = true,
        desc = "Neogit",
      },
    },
  },

  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show {
          -- global = false,
        }
      end,
      -- desc = "Buffer Local Keymaps (which-key)",
      desc = "Keymaps (which-key)",
    },
  },
}

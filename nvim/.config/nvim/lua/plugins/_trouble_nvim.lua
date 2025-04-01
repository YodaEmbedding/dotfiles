return {
  "folke/trouble.nvim",

  cmd = { "Trouble" },

  keys = {
    {
      "<space>tt",
      "<Cmd>Trouble<CR>",
      desc = "Trouble toggle",
    },
    {
      "<space>tl",
      "<Cmd>Trouble loclist toggle<CR>",
      desc = "Trouble loclist toggle",
    },
    {
      "<space>tq",
      "<Cmd>Trouble quickfix toggle<CR>",
      desc = "Trouble quickfix toggle",
    },
    {
      "<space>tw",
      "<Cmd>Trouble diagnostics toggle<CR>",
      desc = "Trouble diagnostics toggle",
    },
    {
      "<space>to",
      "<Cmd>Trouble todo toggle<CR>",
      desc = "Trouble todo toggle",
    },
  },

  opts = {
    -- auto_preview = false,
  },
}

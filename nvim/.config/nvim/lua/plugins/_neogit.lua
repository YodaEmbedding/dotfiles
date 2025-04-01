return {
  "NeogitOrg/neogit",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },

  cmd = { "Neogit" },

  keys = {
    {
      "<space>gn",
      ":Neogit <Cmd>call feedkeys(\"\\<Tab>\", 'nt')<CR>",
      desc = "Neogit",
    },
    {
      "<space>gdd",
      "<Cmd>Neogit diff<CR>",
      desc = "Neogit diff",
    },
    {
      "<space>gl",
      "<Cmd>Neogit log<CR>",
      desc = "Neogit log",
    },
    {
      "<space>gs",
      "<Cmd>Neogit<CR>",
      desc = "Neogit status",
    },
  },

  config = true,
}

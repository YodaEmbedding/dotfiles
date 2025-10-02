return {
  "bassamsdata/namu.nvim",

  opts = {
    global = {
    },
    namu_symbols = {
      options = {
      },
    },
  },

  keys = {
    {
      "_", -- "<leader>ss",
      ":Namu symbols<CR>",
      desc = "Jump to LSP symbol",
      silent = true,
    },
    {
      "<leader>sw",
      ":Namu workspace<CR>",
      desc = "LSP Symbols - Workspace",
      silent = true,
    },
  },
}

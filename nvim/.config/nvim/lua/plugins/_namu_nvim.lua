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
      "_",
      ":Namu symbols<CR>",
      desc = "Jump to LSP symbol",
      silent = true,
    },
    {
      "<space>-",
      ":Namu workspace<CR>",
      desc = "LSP Symbols - Workspace",
      silent = true,
    },
    {
      "<C-t>",
      ":Namu workspace<CR>",
      desc = "LSP Symbols - Workspace",
      silent = true,
    },
  },
}

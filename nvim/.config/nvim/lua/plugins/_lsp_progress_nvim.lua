return {
  "linrongbin16/lsp-progress.nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    require("lsp-progress").setup {
    }
  end,
}

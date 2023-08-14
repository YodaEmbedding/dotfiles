return {
  "barreiroleo/ltex_extra.nvim",

  enabled = false,

  dependencies = {
    "neovim/nvim-lspconfig",
  },

  ft = { "markdown", "tex" },

  config = function()
    require("ltex_extra").setup {
    }
  end
}

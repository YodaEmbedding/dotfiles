return {
  "jhofscheier/ltex-utils.nvim",

  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    -- "nvim-telescope/telescope-fzf-native.nvim", -- optional
  },

  opts = {
  },

  _ = {
    on_attach = function(client, bufnr)
      require("ltex-utils").on_attach(bufnr)
    end,
  },
}

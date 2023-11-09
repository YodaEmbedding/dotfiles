return {
  "jhofscheier/ltex-utils.nvim",

  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    -- "nvim-telescope/telescope-fzf-native.nvim", -- optional
  },

  opts = {
    dictionary = {
      path = vim.api.nvim_call_function("stdpath", {"state"}) .. "/ltex/",
    },
  },

  _ = {
    on_attach = function(client, bufnr)
      require("ltex-utils").on_attach(bufnr)
    end,
  },
}

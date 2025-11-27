return {
  "kosayoda/nvim-lightbulb",

  enabled = false,

  dependencies = {
    -- "antoinemadec/FixCursorHold.nvim",
  },

  opts = {
    autocmd = { enabled = true },
    -- float = { enabled = true },
    -- virtual_text = { enabled = true },
    -- status_text = { enabled = true },

    ignore = {
      clients = {
        "ruff_lsp",
      },
    },
  },
}

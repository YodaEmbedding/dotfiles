return {
  "zeioth/garbage-day.nvim",

  dependencies = {
    "neovim/nvim-lspconfig",
  },

  event = "VeryLazy",

  opts = {
    -- Table of LSP clients that should never be stopped.
    -- excluded_lsp_clients = { "null-ls", "jdtls", "marksman" },

    -- Seconds to wait before stopping all LSP clients after neovim loses focus.
    grace_period = 60 * 60,

    -- Milliseconds to wait before restoring LSP after the mouse re-enters nvim.
    -- Useful to avoid waking up the LSP clients by accident when passing the mouse over it.
    wakeup_delay = 0,
  },
}

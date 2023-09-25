return {
  "VidocqH/lsp-lens.nvim",

  -- enabled = false,

  config = function()
    require("lsp-lens").setup {
      -- sections = {
      --   definition = false,
      --   references = true,
      --   implements = false,
      -- },
    }
  end,
}

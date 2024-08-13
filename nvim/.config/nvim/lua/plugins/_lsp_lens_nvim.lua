return {
  "VidocqH/lsp-lens.nvim",

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

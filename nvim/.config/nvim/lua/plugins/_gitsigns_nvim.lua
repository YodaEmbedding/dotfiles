return {
  "lewis6991/gitsigns.nvim",

  config = function()
    require("gitsigns").setup {
      on_attach = require("mappings._gitsigns_nvim").on_attach,
    }
  end,
}

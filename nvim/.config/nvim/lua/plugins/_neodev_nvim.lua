return {
  "folke/neodev.nvim",

  config = function()

  end,

  _ = {
    on_lspconfig_load = function()
      require("neodev").setup {

      }
    end,
  },
}

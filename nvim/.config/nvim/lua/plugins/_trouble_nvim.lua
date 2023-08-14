return {
  "folke/trouble.nvim",

  config = function()
    require("trouble").setup {}

    require("mappings._trouble_nvim")
  end,
}

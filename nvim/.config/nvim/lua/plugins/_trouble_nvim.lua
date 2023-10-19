return {
  "folke/trouble.nvim",

  config = function()
    require("trouble").setup {
      -- auto_preview = false,
    }

    require("mappings._trouble_nvim")
  end,
}

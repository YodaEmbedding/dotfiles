return {
  "folke/trouble.nvim",

  cmd = { "Trouble" },

  keys = require("mappings._trouble_nvim"),

  config = function()
    require("trouble").setup {
      -- auto_preview = false,
    }
  end,
}

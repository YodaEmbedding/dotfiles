return {
  "utilyre/barbecue.nvim",

  enabled = false,

  version = "*",
  -- name = "barbecue",

  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },

  config = function()
    require("barbecue").setup {
      kinds = require("utils.lspkind_symbols")._.kind_symbol_map,
    }
  end,
}

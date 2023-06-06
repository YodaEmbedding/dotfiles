return {
  -- name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
    -- "folke/tokyonight.nvim",  -- colorscheme
  },
  config = function()
    require("barbecue").setup {
      kinds = require("plugins._lspkind_symbols")._.kind_symbol_map,
    }
  end,
}

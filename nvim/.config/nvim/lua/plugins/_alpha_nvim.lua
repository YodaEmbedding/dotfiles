return {
  "goolord/alpha-nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,

  config = function()
    local alpha = require("alpha")
    local theme = require("alpha.themes.startify").config

    theme.layout[2].val = {
      "1.e4 e5 2.Ke2 Ke7 3.Ke1 Ke8 4.Ke2 Ke7 5.Ke1 Ke8 6.Ke2 Ke7 1/2-1/2",
    }

    alpha.setup(theme)
  end,
}

return {
  "folke/drop.nvim",

  enabled = false,

  event = "VimEnter",

  opts = {
    theme = "snow",
    screensaver = false,
    interval = 500,
    max = 8,
  },

  config = function(_, opts)
    math.randomseed(os.time())

    require("drop").setup(opts)
  end,
}

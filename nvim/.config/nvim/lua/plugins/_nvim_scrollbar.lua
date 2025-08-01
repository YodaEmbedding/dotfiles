return {
  "petertriho/nvim-scrollbar",

  opts = {
    handle = {
      color = "#5C4561",
    },
    marks = {
      Info = { text = { "" } },
      Hint = { text = { "" } },
      Misc = { text = { "" } },
    },
  },

  config = function(_, opts)
    require("scrollbar").setup(opts)
    require("scrollbar.handlers.gitsigns").setup()
  end,
}

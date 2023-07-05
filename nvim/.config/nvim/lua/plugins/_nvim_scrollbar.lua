return {
  "petertriho/nvim-scrollbar",

  config = function()
    require("scrollbar").setup {
      handle = {
        color = "#5C4561",
      },
    }
  end,
}

return {
  "nvim-focus/focus.nvim",

  config = function()
    require("focus").setup {
      autoresize = {
        minwidth = 20,
        minheight = 0,
        height_quickfix = 10,
      },
    }
  end,
}

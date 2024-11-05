return {
  "gelguy/wilder.nvim",

  config = function()
    require("wilder").setup {
      modes = { ":", "/", "?" },
    }
  end,
}

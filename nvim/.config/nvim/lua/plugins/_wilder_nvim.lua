return {
  "gelguy/wilder.nvim",

  config = function()
    require("wilder").setup {
      modes = { ":", "/", "?" },
      accept_completion_auto_select = 0,
    }
  end,
}

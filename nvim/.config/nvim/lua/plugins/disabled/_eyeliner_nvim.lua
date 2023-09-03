return {
  "jinh0/eyeliner.nvim",

  config = function()
    require("eyeliner").setup {
      highlight_on_key = false,
      dim = false,
    }
  end,
}

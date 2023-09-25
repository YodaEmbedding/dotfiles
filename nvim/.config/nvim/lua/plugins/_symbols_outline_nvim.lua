return {
  "simrat39/symbols-outline.nvim",

  config = function()
    require("symbols-outline").setup {
      symbol_blacklist = {
        "Constant",
        "Variable",
      },
    }
  end,
}

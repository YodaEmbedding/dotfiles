return {
  "simrat39/symbols-outline.nvim",

  enabled = false,

  config = function()
    require("symbols-outline").setup {
      symbol_blacklist = {
        "Constant",
        "Variable",
      },
    }
  end,
}

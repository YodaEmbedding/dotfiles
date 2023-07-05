return {
  enabled = false,

  config = function()
    require("registers").setup {
      window = {
        border = "rounded",
        transparency = 0,
      },
    }
  end,
}

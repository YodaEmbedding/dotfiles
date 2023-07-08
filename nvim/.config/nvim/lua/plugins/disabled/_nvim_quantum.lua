return {
  "mastertinner/nvim-quantum",

  enabled = false,

  config = function()
    require("quantum").setup()
  end,
}

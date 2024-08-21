return {
  "bloznelis/before.nvim",

  keys = require("mappings._before_nvim"),

  config = function()
    require("before").setup {}
  end
}

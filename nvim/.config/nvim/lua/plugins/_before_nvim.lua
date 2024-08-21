return {
  "bloznelis/before.nvim",

  config = function()
    require("before").setup {}

    require("mappings._before_nvim")
  end
}

return {
  "ggandor/lightspeed.nvim",

  enabled = false,

  init = function()
    vim.g.lightspeed_no_default_keymaps = true
  end,

  opts = {
    ignore_case = true,
  },

  config = function(_, opts)
    require("lightspeed").setup(opts)

    require("mappings._lightspeed_nvim")
  end,
}

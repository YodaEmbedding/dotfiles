return {
  init = function()
    vim.g.lightspeed_no_default_keymaps = true
  end,

  config = function()
    require("lightspeed").setup {
      ignore_case = true,
    }

    require("mappings._lightspeed_nvim")
  end,
}

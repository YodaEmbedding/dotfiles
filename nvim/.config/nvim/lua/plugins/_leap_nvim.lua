return {
  config = function()
    require("leap").set_default_keymaps()

    require("leap").setup {
      case_sensitive = false,
    }

    require("mappings._leap_nvim")
  end,
}

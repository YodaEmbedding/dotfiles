return {
  "ggandor/leap.nvim",

  enabled = false,

  config = function()
    -- require("leap").set_default_keymaps()  -- NOTE: deprecated
    -- require("leap").add_default_mappings()

    require("leap").setup {
      case_sensitive = false,
    }

    require("mappings._leap_nvim")
  end,
}

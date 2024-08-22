return {
  "ggandor/leap.nvim",

  enabled = false,

  opts = {
    case_sensitive = false,
  },

  config = function(_, opts)
    -- require("leap").set_default_keymaps()  -- NOTE: deprecated
    -- require("leap").add_default_mappings()

    require("leap").setup(opts)

    require("mappings._leap_nvim")
  end,
}

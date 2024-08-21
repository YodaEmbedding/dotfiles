return {
  "folke/trouble.nvim",

  cmd = { "Trouble" },

  init = function()
    -- Since we load lazily upon cmd, set up the mappings in init, not config.
    require("mappings._trouble_nvim")
  end,

  config = function()
    require("trouble").setup {
      -- auto_preview = false,
    }
  end,
}

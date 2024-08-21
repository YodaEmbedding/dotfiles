return {
  "stevearc/aerial.nvim",

  init = function()
    -- Since we load lazily upon cmd, set up the mappings in init, not config.
    require("mappings._aerial_nvim")
  end,

  cmd = {
    "AerialOpen",
    "AerialNavOpen",
    "AerialToggle",
    "AerialNavToggle",
  },

  config = function()
    require("aerial").setup {
      layout = {
        default_direction = "float",
      },
      -- highlight_on_hover = true,
      autojump = true,
      close_on_select = true,
      float = {
        relative = "win",
        override = function(conf, source_winid)
          local padding = 1
          conf.anchor = 'NE'
          conf.row = padding
          conf.col = vim.api.nvim_win_get_width(source_winid) - padding
          return conf
        end,
      },
    }
  end,
}

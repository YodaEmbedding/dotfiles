return {
  "stevearc/aerial.nvim",

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

    require("mappings._aerial_nvim")
  end,
}

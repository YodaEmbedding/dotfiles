return {
  "stevearc/aerial.nvim",

  enabled = false,

  cmd = {
    "AerialOpen",
    "AerialNavOpen",
    "AerialToggle",
    "AerialNavToggle",
  },

  keys = {
    {
      "<Space>o",
      function() require("aerial").toggle() end,
      desc = "Outline",
    },
    {
      "_",
      function() require("aerial").nav_toggle() end,
      desc = "Outline (nav)",
    },
  },

  opts = {
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
  },
}

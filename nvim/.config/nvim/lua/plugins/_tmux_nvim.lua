return {
  "aserowy/tmux.nvim",

  keys = require("mappings._tmux_nvim"),

  config = function()
    require("tmux").setup {
      navigation = {
        enable_default_keybindings = false,
      },
      resize = {
        enable_default_keybindings = false,
        resize_step_x = 2,
        resize_step_y = 2,
      },
    }
  end,
}

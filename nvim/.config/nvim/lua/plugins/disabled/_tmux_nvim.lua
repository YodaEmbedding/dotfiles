return {
  "aserowy/tmux.nvim",

  enabled = false,

  keys = {
    -- NOTE: all_modes = { "n", "i", "c", "v", "o", "t", "l" }

    { "<M-h>", function() require("tmux").move_left() end,     { "n", "i", "c", "v", "o", "t", "l" } },
    { "<M-j>", function() require("tmux").move_bottom() end,   { "n", "i", "c", "v", "o", "t", "l" } },
    { "<M-k>", function() require("tmux").move_top() end,      { "n", "i", "c", "v", "o", "t", "l" } },
    { "<M-l>", function() require("tmux").move_right() end,    { "n", "i", "c", "v", "o", "t", "l" } },

    { "<M-H>", function() require("tmux").resize_left() end,   { "n", "i", "c", "v", "o", "t", "l" } },
    { "<M-J>", function() require("tmux").resize_bottom() end, { "n", "i", "c", "v", "o", "t", "l" } },
    { "<M-K>", function() require("tmux").resize_top() end,    { "n", "i", "c", "v", "o", "t", "l" } },
    { "<M-L>", function() require("tmux").resize_right() end,  { "n", "i", "c", "v", "o", "t", "l" } },
  },

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

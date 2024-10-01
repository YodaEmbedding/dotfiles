local all_modes = { "n", "i", "c", "v", "o", "t", "l" }
local opts = { noremap = true, mode = all_modes }

return {
  { "<M-h>", function() require("tmux").move_left() end, opts },
  { "<M-j>", function() require("tmux").move_bottom() end, opts },
  { "<M-k>", function() require("tmux").move_top() end, opts },
  { "<M-l>", function() require("tmux").move_right() end, opts },

  { "<M-H>", function() require("tmux").resize_left() end, opts },
  { "<M-J>", function() require("tmux").resize_bottom() end, opts },
  { "<M-K>", function() require("tmux").resize_top() end, opts },
  { "<M-L>", function() require("tmux").resize_right() end, opts },
}

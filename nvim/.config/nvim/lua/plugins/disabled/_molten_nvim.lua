return {
  "benlubas/molten-nvim",

  enabled = false,

  version = "^1.0.0",
  lazy = false,

  dependencies = {
    "3rd/image.nvim",
  },

  build = ":UpdateRemotePlugins",

  init = function()
    -- vim.g.molten_output_win_max_height = 12
  end,
}

return {
  "prochri/telescope-all-recent.nvim",

  dependencies = {
    "kkharji/sqlite.lua",
    -- "nvim-telescope/telescope.nvim",  -- Disable to facilitate lazy loading.
  },

  lazy = true,

  config = function()
    require("telescope-all-recent").setup {}
  end,
}

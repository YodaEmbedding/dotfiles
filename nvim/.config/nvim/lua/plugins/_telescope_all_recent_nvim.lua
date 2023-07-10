return {
  "prochri/telescope-all-recent.nvim",

  dependencies = {
    "kkharji/sqlite.lua",
    "nvim-telescope/telescope.nvim",
  },

  lazy = true,

  config = function()
    require("telescope-all-recent").setup {}
  end,
}

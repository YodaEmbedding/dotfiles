return {
  "prochri/telescope-all-recent.nvim",

  dependencies = {
    "kkharji/sqlite.lua",
    "nvim-telescope/telescope.nvim",
  },

  config = function()
    require("telescope-all-recent").setup {}
  end,
}

return {
  dependencies = {
    "kkharji/sqlite.lua",
    "nvim-telescope/telescope.nvim",
  },

  config = function()
    require("telescope-all-recent").setup {}
  end,
}

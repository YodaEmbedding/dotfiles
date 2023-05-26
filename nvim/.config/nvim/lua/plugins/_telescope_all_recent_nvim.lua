return {
  dependencies = {
    "tami5/sqlite.lua",
    "nvim-telescope/telescope.nvim",
  },

  config = function()
    require("telescope-all-recent").setup {}
  end,
}

return {
  "nvim-telescope/telescope-frecency.nvim",

  enabled = false,

  dependencies = {
    "kkharji/sqlite.lua",
  },

  config = function()
    require("telescope").load_extension("frecency")
  end,
}

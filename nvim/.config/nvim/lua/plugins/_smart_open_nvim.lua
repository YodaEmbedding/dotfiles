return {
  "danielfalk/smart-open.nvim",

  branch = "0.2.x",

  dependencies = {
    "kkharji/sqlite.lua",
    "nvim-telescope/telescope.nvim",

    -- Optional. Only required if using match_algorithm fzf.
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

    -- Optional. If installed, native fzy will be used when match_algorithm is fzy.
    { "nvim-telescope/telescope-fzy-native.nvim" },
  },

  lazy = true,

  config = function()
    require("telescope").load_extension("smart_open")
  end,
}

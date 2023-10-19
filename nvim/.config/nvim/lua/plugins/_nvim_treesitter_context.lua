return {
  "nvim-treesitter/nvim-treesitter-context",

  config = function()
    require("treesitter-context").setup {
      -- max_lines = 0,
      mode = "topline",  -- Default: "cursor"
      multiline_threshold = 1,
      trim_scope = "inner",
    }
  end,
}

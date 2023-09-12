return {
  "tzachar/local-highlight.nvim",

  config = function()
    require("local-highlight").setup {
      disable_file_types = { "tex", "markdown" },
      hlgroup = "LocalHighlight",
      cw_hlgroup = "CWLocalHighlight",
    }
  end,
}

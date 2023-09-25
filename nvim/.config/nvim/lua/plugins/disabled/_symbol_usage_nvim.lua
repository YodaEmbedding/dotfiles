return {
  "Wansmer/symbol-usage.nvim",

  -- On nvim 0.9, need to run before LspAttach.
  -- On nvim 0.10, use "LspAttach".
  event = "BufReadPre",

  enabled = false,

  config = function()
    require("symbol-usage").setup {
      vt_position = "end_of_line",
    }
  end,
}

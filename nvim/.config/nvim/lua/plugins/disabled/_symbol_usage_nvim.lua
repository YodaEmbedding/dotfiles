return {
  "Wansmer/symbol-usage.nvim",

  enabled = false,

  -- On nvim 0.9, need to run before LspAttach.
  -- On nvim 0.10, use "LspAttach".
  event = "BufReadPre",

  opts = {
    vt_position = "end_of_line",
  },
}

return {
  "tzachar/highlight-undo.nvim",

  enabled = false,

  opts = {
    hlgroup = "HighlightUndo",
    duration = 300,
    keymaps = {
      {"n", "u", "undo", {}},
      {"n", "<C-r>", "redo", {}},
    }
  },
}

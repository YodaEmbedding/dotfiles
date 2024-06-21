return {
  "folke/todo-comments.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  opts = {
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      pattern = [[\b(KEYWORDS)\b]],
    },
  },
}

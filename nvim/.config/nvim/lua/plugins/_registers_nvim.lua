return {
  "tversteeg/registers.nvim",

  -- name = "registers",

  cmd = "Registers",

  keys = {
    { "\"",    mode = { "n", "v" } },
    { "<C-R>", mode = "i" },
  },

  config = {
      window = {
        border = "rounded",
        transparency = 0,
      },
  },
}

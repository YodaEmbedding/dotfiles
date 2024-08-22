return {
  "tversteeg/registers.nvim",

  enabled = false,

  -- name = "registers",

  cmd = "Registers",

  keys = {
    { "\"",    mode = { "n", "v" } },
    { "<C-R>", mode = "i" },
  },

  opts = {
      window = {
        border = "rounded",
        transparency = 0,
      },
  },
}

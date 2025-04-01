return {
  "nvim-neo-tree/neo-tree.nvim",

  enabled = false,

  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
  },
  branch = "v2.x",

  keys = {
    {
      "<space>T",
      ":NeoTreeFocusToggle<CR>",
      desc = "NeoTree toggle",
    },
  },
}

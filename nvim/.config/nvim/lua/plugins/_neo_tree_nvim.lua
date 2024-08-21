return {
  "nvim-neo-tree/neo-tree.nvim",

  enabled = false,

  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
  },
  branch = "v2.x",

  keys = require("mappings._neo_tree_nvim"),
}

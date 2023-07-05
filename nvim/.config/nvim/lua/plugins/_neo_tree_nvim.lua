return {
  "nvim-neo-tree/neo-tree.nvim",

  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
  },
  branch = "v2.x",

  config = function()
    require("mappings._neo_tree_nvim")
  end,
}

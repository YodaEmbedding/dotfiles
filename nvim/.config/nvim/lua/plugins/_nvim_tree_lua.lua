return {
  "nvim-tree/nvim-tree.lua",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  init = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,

  config = function()
    require("nvim-tree").setup {
      sort_by = "case_sensitive",
      disable_netrw = true,
      view = {
        width = 30,
      },
      renderer = {
        -- group_empty = true,
      },
      filters = {
        -- dotfiles = true,
      },
    }

    -- require("mappings._nvim_tree_lua")
  end,
}

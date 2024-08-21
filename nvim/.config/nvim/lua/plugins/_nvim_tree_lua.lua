return {
  "nvim-tree/nvim-tree.lua",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  cmd = {
    "NvimTreeFindFileToggle",
    "NvimTreeFocus",
    "NvimTreeToggle",
  },

  init = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Since we load lazily upon cmd, set up the mappings in init, not config.
    require("mappings._nvim_tree_lua")
  end,

  config = function()
    require("nvim-tree").setup {
      sort_by = "case_sensitive",
      disable_netrw = true,
      view = {
        side = "right",
        width = 30,
      },
      renderer = {
        -- group_empty = true,
      },
      update_focused_file = {
        enable = true,
      },
      filters = {
        -- dotfiles = true,
      },
    }
  end,
}

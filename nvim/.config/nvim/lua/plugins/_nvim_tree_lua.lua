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

  keys = {
    {
      "<space>T",
      ":NvimTreeFindFileToggle<CR>",
      desc = "NvimTree toggle",
    },
  },

  init = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,

  opts = {
    sort_by = "case_sensitive",
    disable_netrw = true,
    view = {
      -- side = "right",
      width = 40,
    },
    renderer = {
      -- group_empty = true,
      full_name = true,
      -- highlight_git = true,
      highlight_opened_files = "name",
      indent_markers = {
        enable = true,
      },
      icons = {
        modified_placement = "before",
      },
    },
    update_focused_file = {
      enable = true,
    },
    filters = {
      -- dotfiles = true,
    },
    modified = {
      enable = true,
    },
  },
}

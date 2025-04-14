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

    local timer
    vim.api.nvim_create_autocmd("CursorMoved", {
      pattern = "NvimTree*",
      callback = function()
        if timer then
          timer:stop()
        end
        timer = vim.defer_fn(function()
          local node = require("nvim-tree.api").tree.get_node_under_cursor()
          if not node or node.type ~= "file" then
            return
          end
          local win_ids = usable_win_ids()
          if #win_ids ~= 1 then
            return
          end
          local win_id = win_ids[1]
          require("nvim-tree.api").node.open.preview()
        end, 5)
      end,
    })
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

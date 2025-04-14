---Copied from nvim-tree.lua/lua/nvim-tree/actions/node/open-file.lua
---Get all windows in the current tabpage that aren't NvimTree.
---@return table with valid win_ids
local function usable_win_ids()
  local M = require("nvim-tree.actions.node.open-file")
  local view = require("nvim-tree.view")

  local tabpage = vim.api.nvim_get_current_tabpage()
  local win_ids = vim.api.nvim_tabpage_list_wins(tabpage)
  local tree_winid = view.get_winnr(tabpage)

  return vim.tbl_filter(function(id)
    local bufid = vim.api.nvim_win_get_buf(id)
    for option, v in pairs(M.window_picker.exclude) do
      local ok, option_value
      if vim.fn.has("nvim-0.10") == 1 then
        ok, option_value = pcall(vim.api.nvim_get_option_value, option, { buf = bufid })
      else
        ok, option_value = pcall(vim.api.nvim_buf_get_option, bufid, option) ---@diagnostic disable-line: deprecated
      end

      if ok and vim.tbl_contains(v, option_value) then
        return false
      end
    end

    local win_config = vim.api.nvim_win_get_config(id)
    return id ~= tree_winid and win_config.focusable and not win_config.external or false
  end, win_ids)
end

local function sendkeys_to_preview_window(keys, timeout)
  local win_ids = usable_win_ids()
  if #win_ids ~= 1 then
    return
  end
  local win_id = win_ids[1]
  local prev_win_id = vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(win_id)
  vim.api.nvim_feedkeys(keys, "n", false)
  vim.defer_fn(function()
    vim.api.nvim_set_current_win(prev_win_id)
  end, timeout or 0)
end


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
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set("n", "<C-u>", function()
        local keys = vim.api.nvim_replace_termcodes("<C-u>", true, false, true)
        sendkeys_to_preview_window(keys, 1)
      end, opts("Scroll Up in Preview"))

      vim.keymap.set("n", "<C-d>", function()
        local keys = vim.api.nvim_replace_termcodes("<C-d>", true, false, true)
        sendkeys_to_preview_window(keys, 1)
      end, opts("Scroll Down in Preview"))
    end,
  },
}

if not _G.plugin_loaded("telescope.nvim") then
  do return end
end

local telescope = require("telescope")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")

local function buffer_previewer_maker(filepath, bufnr, opts)
  opts = opts or {}
  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then
      return
    end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

telescope.setup{
  defaults = {

    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ["<C-c>"] = function()
          vim.cmd [[stopinsert]]
        end,
      },
    },

    layout_defaults = {
      horizontal = {
        height_padding = 1,
      },
      vertical = {
        height_padding = 1,
      },
    },

    buffer_previewer_maker = buffer_previewer_maker,

  },
}

if _G.plugin_loaded("telescope-harpoon.nvim") then
  telescope.load_extension("harpoon")
end

if not _G.plugin_loaded("telescope.nvim") then
  do return end
end

local b = require("telescope.builtin")
local vimp = require("vimp")

local nnoremap = vimp.nnoremap

local smart_files = function()
  local in_git_repo = vim.fn.systemlist("git rev-parse --is-inside-work-tree")[1] == 'true'
  if in_git_repo then
    local opts = {
      show_untracked = true,
      use_git_root = false,
    }
    b.git_files(opts)
  else
    local opts = {}
    b.find_files(opts)
  end
end


---@format disable

nnoremap("<Space><Space>",  b.builtin)
nnoremap("<Tab>",           b.buffers)
nnoremap(",",               smart_files)
-- nnoremap(",",               b.git_files)
-- nnoremap("<f",              b.find_files)
-- nnoremap("<l",              b.live_grep)
nnoremap("<CR>",            b.current_buffer_fuzzy_find)
nnoremap("<m",              b.marks)
nnoremap("<:",              b.command_history)
nnoremap("gr",              b.lsp_references)

if not _G.plugin_loaded("telescope.nvim") then
  do return end
end

local b = require("telescope.builtin")
local vimp = require("vimp")

local nnoremap = vimp.nnoremap

nnoremap("<Space><Space>",  b.builtin)
nnoremap("<Tab>",           b.buffers)
-- nnoremap(",",               b.git_files)
-- nnoremap("<f",              b.find_files)
-- nnoremap("<l",              b.live_grep)
nnoremap("<CR>",            b.current_buffer_fuzzy_find)
nnoremap("<m",              b.marks)
nnoremap("<:",              b.command_history)
nnoremap("gr",              b.lsp_references)

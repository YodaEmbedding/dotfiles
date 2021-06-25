if not _G.plugin_loaded("telescope.nvim") then
  do return end
end

local b = require("telescope.builtin")
local vimp = require("vimp")

local nnoremap = vimp.nnoremap

nnoremap(",",               b.git_files)
nnoremap("\\f",             b.find_files)
nnoremap("<Tab>",           function () b.buffers {sort_lastused=true} end)
nnoremap("<Space><Space>",  b.builtin)
nnoremap("<Space>g",        b.live_grep)
nnoremap("<Space>m",        b.marks)
nnoremap("<Space>h",        b.command_history)
nnoremap("gr",              b.lsp_references)

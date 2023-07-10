if not _G.plugin_loaded("telescope.nvim") then
  do return end
end

local b = require("telescope.builtin")
local map = vim.keymap.set

---@format disable

map("n", "<Space><Space>",  b.builtin)
map("n", "<Tab>",           b.buffers)
-- map("n", ",",               smart_files)
map("n", ",",               require("telescope").extensions.smart_open.smart_open)
map("n", "<CR>",            b.current_buffer_fuzzy_find)
map("n", "<m",              b.marks)
map("n", "<:",              b.command_history)

map("n", "gd",              b.lsp_definitions)
map("n", "gi",              b.lsp_implementations)
map("n", "gr",              b.lsp_references)

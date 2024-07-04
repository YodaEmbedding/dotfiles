if not _G.plugin_loaded("telescope.nvim") then
  do return end
end

local map = vim.keymap.set

---@format disable

local b = {
  builtin                   = function() require("telescope.builtin").builtin() end,
  buffers                   = function() require("telescope.builtin").buffers() end,
  smart_open                = function() require("telescope").extensions.smart_open.smart_open() end,
  smart_open_cwd            = function() require("telescope").extensions.smart_open.smart_open({cwd_only = true, filename_first = true}) end,
  current_buffer_fuzzy_find = function() require("telescope.builtin").current_buffer_fuzzy_find() end,
  jumplist                  = function() require("telescope.builtin").jumplist() end,
  live_grep                 = function() require("telescope.builtin").live_grep() end,
  marks                     = function() require("telescope.builtin").marks() end,
  resume                    = function() require("telescope.builtin").resume() end,
  command_history           = function() require("telescope.builtin").command_history() end,
  lsp_definitions           = function() require("telescope.builtin").lsp_definitions() end,
  lsp_dynamic_workspace_symbols = function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end,
  lsp_implementations       = function() require("telescope.builtin").lsp_implementations() end,
  lsp_references            = function() require("telescope.builtin").lsp_references({show_line = false}) end,
}

map("n", "<Space><Space>",  b.builtin)
map("n", "<Tab>",           b.buffers)
map("n", ",",               b.smart_open_cwd)
map("n", "<Space>,",        b.smart_open)
map("n", "-",               b.current_buffer_fuzzy_find)
map("n", "<CR>",            b.jumplist)
map("n", "_",               b.live_grep)
map("n", "<Space>m",        b.marks)
map("n", "<Space>r",        b.resume)
map("n", "<Space>:",        b.command_history)

map("n", "gd",              b.lsp_definitions)
map("n", "<C-t>",           b.lsp_dynamic_workspace_symbols)
map("n", "gi",              b.lsp_implementations)
map("n", "gr",              b.lsp_references)

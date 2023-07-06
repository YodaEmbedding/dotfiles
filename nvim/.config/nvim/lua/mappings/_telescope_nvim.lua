if not _G.plugin_loaded("telescope.nvim") then
  do return end
end

local b = require("telescope.builtin")

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

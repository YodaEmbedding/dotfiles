if not _G.plugin_loaded("trouble.nvim") then
  do return end
end

vim.keymap.set("n", "<space>t", ":TroubleToggle<CR>")
vim.keymap.set("n", "<space>l", ":TroubleToggle loclist<CR>")
vim.keymap.set("n", "<space>q", ":TroubleToggle quickfix<CR>")
vim.keymap.set("n", "<space>w", ":TroubleToggle workspace_diagnostics<CR>")

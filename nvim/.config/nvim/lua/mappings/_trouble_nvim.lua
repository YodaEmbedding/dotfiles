if not _G.plugin_loaded("trouble.nvim") then
  do return end
end

vim.keymap.set("n", "<space>t", ":Trouble<CR>")
vim.keymap.set("n", "<space>l", ":Trouble loclist toggle<CR>")
vim.keymap.set("n", "<space>q", ":Trouble quickfix toggle<CR>")
vim.keymap.set("n", "<space>w", ":Trouble diagnostics toggle<CR>")

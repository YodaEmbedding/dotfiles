if not _G.plugin_loaded("neo-tree.nvim") then
  do return end
end

vim.keymap.set("n", "<space>t", ":NeoTreeFocusToggle<CR>")

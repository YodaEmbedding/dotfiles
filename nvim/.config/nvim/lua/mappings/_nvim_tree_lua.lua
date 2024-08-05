if not _G.plugin_loaded("nvim-tree.lua") then
  do return end
end

vim.keymap.set("n", "<space>T", ":NvimTreeFindFileToggle<CR>")

if not _G.plugin_loaded("trouble.nvim") then
  do return end
end

vim.keymap.set("n", "<space>t", ":TroubleToggle<CR>")

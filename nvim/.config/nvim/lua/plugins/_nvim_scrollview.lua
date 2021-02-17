if not _G.plugin_loaded("nvim-scrollview") then
  do return end
end

vim.g.scrollview_base = "buffer"
vim.g.scrollview_column = 80

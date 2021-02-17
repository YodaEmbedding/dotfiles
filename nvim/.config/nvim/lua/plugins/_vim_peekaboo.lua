if not _G.plugin_loaded("vim-peekaboo") then
  do return end
end

vim.g.peekaboo_window = "lua require('utils').create_centered_floating_window()"

if not _G.plugin_loaded("vim-gutentags") then
  do return end
end

vim.g.gutentags_file_list_command = "rg --files"

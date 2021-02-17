if not _G.plugin_loaded("ultisnips") then
  do return end
end

vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"

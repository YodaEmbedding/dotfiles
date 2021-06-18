if not _G.plugin_loaded("nvim-lightbulb") then
  do return end
end

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

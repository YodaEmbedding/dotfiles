if not _G.plugin_loaded("completion-nvim") then
  do return end
end

vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }

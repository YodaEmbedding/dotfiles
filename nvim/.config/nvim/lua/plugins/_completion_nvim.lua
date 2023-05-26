return {
  init = function()
    vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }
  end,
}

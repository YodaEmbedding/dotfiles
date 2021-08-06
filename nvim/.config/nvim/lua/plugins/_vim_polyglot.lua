if not _G.plugin_loaded("vim-polyglot") then
  do return end
end

vim.g.polyglot_disabled = {
  "autoindent",
  -- "python-indent",
  "sensible",
  "tex",
}

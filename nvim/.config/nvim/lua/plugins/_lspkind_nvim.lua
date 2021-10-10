if not _G.plugin_loaded("lspkind-nvim") then
  do return end
end

if _G.plugin_loaded("nvim-cmp") then
  do return end
end

require("lspkind").init {}

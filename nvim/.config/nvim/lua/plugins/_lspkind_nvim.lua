if not _G.plugin_loaded("lspkind-nvim") then
  do return end
end

require("lspkind").init {}

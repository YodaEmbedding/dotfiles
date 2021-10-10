if not _G.plugin_loaded("lspkind-nvim") then
  do return end
end

if _G.plugin_loaded("nvim-cmp") then
  do return end
end

local config = require("plugins._lspkind_symbols")
require("lspkind").init {
  symbol_map = config.symbol_map,
}

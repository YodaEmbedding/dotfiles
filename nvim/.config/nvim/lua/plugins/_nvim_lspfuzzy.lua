if not _G.plugin_loaded("nvim-lspfuzzy") then
  do return end
end

require("lspfuzzy").setup {}

if not _G.plugin_loaded("gitsigns.nvim") then
  do return end
end

require("gitsigns").setup()

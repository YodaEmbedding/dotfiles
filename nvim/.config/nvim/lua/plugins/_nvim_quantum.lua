if not _G.plugin_loaded("nvim-quantum") then
  do return end
end

require("quantum").setup()

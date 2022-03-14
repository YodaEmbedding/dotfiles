if not _G.plugin_loaded("virt-column.nvim") then
  do return end
end

require("virt-column").setup {
  char = "│",
}

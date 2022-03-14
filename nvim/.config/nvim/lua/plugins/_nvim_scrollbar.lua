if not _G.plugin_loaded("nvim-scrollbar") then
  do return end
end

require("scrollbar").setup {
  handle = {
    color = "#5C4561",
  },
}

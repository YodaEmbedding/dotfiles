if not _G.plugin_loaded("nvim-autopairs") then
  do return end
end

require("nvim-autopairs").setup {
  ignored_next_char = "[%w%.]"
}

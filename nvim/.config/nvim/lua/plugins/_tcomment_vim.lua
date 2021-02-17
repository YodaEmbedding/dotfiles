if not _G.plugin_loaded("tcomment_vim") then
  do return end
end

vim.g.tcomment_mapleader1 = ""
vim.g.tcomment_types = {
  c = "// %s",
}

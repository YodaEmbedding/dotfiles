if not _G.plugin_loaded("coc.nvim") then
  do return end
end

vim.g.coc_global_extensions = {
  "coc-css",
  "coc-git",
  "coc-highlight",
  "coc-html",
  "coc-java",
  "coc-json",
  "coc-lists",
  "coc-lua",
  "coc-pyright",
  "coc-rls",
  "coc-texlab",
  "coc-tsserver",
  "coc-vimlsp",
  -- "coc-vimtex",
  "coc-yaml",
}

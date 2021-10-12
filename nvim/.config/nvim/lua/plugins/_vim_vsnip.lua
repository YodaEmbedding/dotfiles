if not _G.plugin_loaded("vim-vsnip") then
  do return end
end

vim.g.vsnip_snippet_dir = vim.fn.expand("~/.config/lsp_snippets")

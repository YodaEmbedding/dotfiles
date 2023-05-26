return {
  init = function()
    vim.g.vsnip_snippet_dir = vim.fn.expand("~/.config/lsp_snippets")
  end,
}

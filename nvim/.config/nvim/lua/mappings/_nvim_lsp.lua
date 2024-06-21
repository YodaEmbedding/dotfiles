local _M = {}

local map = vim.keymap.set

---@format disable-next
function _M.on_attach()
  if not _G.plugin_loaded("telescope.nvim") then
    map("n", "gd",      vim.lsp.buf.definition)
    map("n", "gi",      vim.lsp.buf.implementation)
    map("n", "gr",      vim.lsp.buf.references)
  end

  -- Navigation
  map("n", "gCi",       vim.lsp.buf.incoming_calls)
  map("n", "gCo",       vim.lsp.buf.outgoing_calls)
  map("n", "gD",        vim.lsp.buf.declaration)
  map("n", "gS",        vim.lsp.buf.document_symbol)
  map("n", "gt",        vim.lsp.buf.type_definition)
  map("n", "gw",        vim.lsp.buf.workspace_symbol)

  -- Documentation
  map("i", "<C-k>",     vim.lsp.buf.signature_help)
  map("n", "K",         vim.lsp.buf.hover)

  -- Diagnostics
  if not _G.plugin_loaded("delimited.nvim") then
    map("n", "[d",      vim.diagnostic.goto_prev)
    map("n", "]d",      vim.diagnostic.goto_next)
  end
  map("n", "<space>z",  vim.diagnostic.setloclist)
  map("n", "<space>e",  vim.diagnostic.open_float)

  -- Refactoring
  local ok, actions_preview = pcall(require, "actions-preview")
  map("n", "<space>a",  ok and actions_preview.code_actions or vim.lsp.buf.code_action)
  map("n", "<F2>",      vim.lsp.buf.rename)
  map("n", "<F4>",      vim.lsp.buf.format)
end

return _M

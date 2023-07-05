local _M = {}

local map = vim.keymap.set

---@format disable-next
function _M.on_attach()
  -- Navigation
  map("n", "gCi",       vim.lsp.buf.incoming_calls)
  map("n", "gCo",       vim.lsp.buf.outgoing_calls)
  map("n", "gd",        vim.lsp.buf.definition)
  map("n", "gD",        vim.lsp.buf.declaration)
  map("n", "g{",        vim.lsp.buf.implementation)
  -- map("n", "gr",        vim.lsp.buf.references)
  map("n", "gS",        vim.lsp.buf.document_symbol)
  map("n", "gt",        vim.lsp.buf.type_definition)
  map("n", "gw",        vim.lsp.buf.workspace_symbol)

  -- Documentation
  map("i", "<C-k>",     vim.lsp.buf.signature_help)
  map("n", "<C-k>",     vim.lsp.buf.signature_help)
  map("n", "K",         vim.lsp.buf.hover)

  -- Diagnostics
  map("n", "[d",        vim.diagnostic.goto_prev)
  map("n", "]d",        vim.diagnostic.goto_next)
  map("n", "<space>z",  vim.diagnostic.setloclist)
  map("n", "<space>e",  vim.diagnostic.open_float)

  -- Refactoring
  local ok, actions_preview = pcall(require, "actions-preview")
  map("n", "<space>a",  ok and actions_preview.code_actions or vim.lsp.buf.code_action)
  map("n", "<space>F", vim.lsp.buf.format)
  map("n", "<space>rn", vim.lsp.buf.rename)

  -- Workspaces
  map("n", "<space>wa", vim.lsp.buf.add_workspace_folder)
  map("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end)
  map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder)
end

return _M

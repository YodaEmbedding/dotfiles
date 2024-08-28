local _M = {}

local ok, actions_preview = pcall(require, "actions-preview")
local code_action = ok and actions_preview.code_actions or vim.lsp.buf.code_action

local mappings = {
  -- Navigation
  { "gCi",      vim.lsp.buf.incoming_calls },
  { "gCo",      vim.lsp.buf.outgoing_calls },
  { "gD",       vim.lsp.buf.declaration },
  { "gS",       vim.lsp.buf.document_symbol },
  { "gt",       vim.lsp.buf.type_definition },
  { "gw",       vim.lsp.buf.workspace_symbol },

  -- Documentation
  { "<C-k>",    vim.lsp.buf.signature_help,  "i" },
  { "K",        vim.lsp.buf.hover },

  -- Diagnostics
  { "<space>z", vim.diagnostic.setloclist },
  { "<space>e", vim.diagnostic.open_float },

  -- Refactoring
  { "<space>a", code_action },
  { "<F2>",     vim.lsp.buf.rename },
  { "<F4>",     vim.lsp.buf.format },
}

if not _G.plugin_loaded("telescope.nvim") then
  local more_mappings = {
    { "gd", vim.lsp.buf.definition },
    { "gi", vim.lsp.buf.implementation },
    { "gr", vim.lsp.buf.references },
  }
  vim.list_extend(mappings, more_mappings)
end

if not _G.plugin_loaded("delimited.nvim") then
  local more_mappings = {
    { "[d", vim.diagnostic.goto_prev },
    { "]d", vim.diagnostic.goto_next },
  }
  vim.list_extend(mappings, more_mappings)
end


function _M.on_attach()
  for _, mapping in ipairs(mappings) do
    vim.keymap.set(mapping[3] or "n", mapping[1], mapping[2], mapping.opts)
  end
end

return _M

local _M = {}

local ok, actions_preview = pcall(require, "actions-preview")
local code_action = ok and actions_preview.code_actions or vim.lsp.buf.code_action

local mappings = {
  -- Navigation
  { "gCi",      vim.lsp.buf.incoming_calls,   desc = "Incoming calls" },
  { "gCo",      vim.lsp.buf.outgoing_calls,   desc = "Outgoing calls" },
  { "gD",       vim.lsp.buf.declaration,      desc = "Go to declaration" },
  { "gS",       vim.lsp.buf.document_symbol,  desc = "Go to document symbol" },
  { "gt",       vim.lsp.buf.type_definition,  desc = "Go to type definition" },
  { "gw",       vim.lsp.buf.workspace_symbol, desc = "Workspace symbols" },

  -- Documentation
  { "<C-k>",    vim.lsp.buf.signature_help,   "i" },
  { "K",        vim.lsp.buf.hover,            desc = "Hover symbol" },

  -- Diagnostics
  { "<space>z", vim.diagnostic.setloclist,    desc = "Diagnostics loclist" },
  { "<space>e", vim.diagnostic.open_float,    desc = "Diagnostics hover" },

  -- Refactoring
  { "<space>a", code_action,                  desc = "Code actions" },
  { "<F2>",     vim.lsp.buf.rename,           desc = "Rename symbol" },
  { "<F4>",     vim.lsp.buf.format,           desc = "Format document" },
}

if not _G.plugin_loaded("telescope.nvim") then
  local more_mappings = {
    { "gd", vim.lsp.buf.definition,     desc = "Go to definition" },
    { "gi", vim.lsp.buf.implementation, desc = "Go to implementation" },
    { "gr", vim.lsp.buf.references,     desc = "Go to references" },
  }
  vim.list_extend(mappings, more_mappings)
end

if not _G.plugin_loaded("delimited.nvim") then
  local more_mappings = {
    { "[d", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic" },
    { "]d", vim.diagnostic.goto_next, desc = "Go to next diagnostic" },
  }
  vim.list_extend(mappings, more_mappings)
end


function _M.on_attach(client, bufnr)
  for _, mapping in ipairs(mappings) do
    mapping.opts = mapping.opts or {}
    mapping.opts.buffer = bufnr
    vim.keymap.set(mapping[3] or "n", mapping[1], mapping[2], mapping.opts)
  end
end

return _M

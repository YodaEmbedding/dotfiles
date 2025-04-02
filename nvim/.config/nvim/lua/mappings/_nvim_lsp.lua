local _M = {}

local actions_preview = require("utils").try_require("actions-preview")
local code_action = actions_preview and actions_preview.code_actions or vim.lsp.buf.code_action

local mappings = {
  -- Navigation
  { "gD",       vim.lsp.buf.declaration,    desc = "Go to declaration" },

  -- Documentation
  { "<C-k>",    vim.lsp.buf.signature_help, "i" },
  { "K",        vim.lsp.buf.hover,          desc = "Hover symbol" },

  -- Diagnostics
  { "<space>e", vim.diagnostic.open_float,  desc = "Diagnostics hover" },

  -- Refactoring
  { "<space>a", code_action,                desc = "Code actions" },
  { "<F2>",     vim.lsp.buf.rename,         desc = "Rename symbol" },
  { "<F4>",     require("utils").format,    desc = "Format document" },
}

if not _G.plugin_loaded("telescope.nvim") then
  local more_mappings = {
    { "gd",  vim.lsp.buf.definition,       desc = "Go to definition" },
    { "gi",  vim.lsp.buf.implementation,   desc = "Go to implementation" },
    { "gr",  vim.lsp.buf.references,       desc = "Go to references" },
    { "gt",  vim.lsp.buf.type_definition,  desc = "Go to type definition" },
    { "gCi", vim.lsp.buf.incoming_calls,   desc = "Incoming calls" },
    { "gCo", vim.lsp.buf.outgoing_calls,   desc = "Outgoing calls" },
    { "gS",  vim.lsp.buf.document_symbol,  desc = "Document symbols" },
    { "gw",  vim.lsp.buf.workspace_symbol, desc = "Workspace symbols" },
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
  require("utils").set_buffer_local_mappings(mappings, bufnr)
end

return _M

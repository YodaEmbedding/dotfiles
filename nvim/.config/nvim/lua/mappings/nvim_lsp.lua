local mappings_nvim_lsp = {}

local vimp = require("vimp")

local inoremap = vimp.inoremap
local nnoremap = vimp.nnoremap
local lsp = vim.lsp

function mappings_nvim_lsp.load()
  -- Navigation
  nnoremap("gci",       lsp.buf.incoming_calls)
  nnoremap("gco",       lsp.buf.outgoing_calls)
  nnoremap("gd",        lsp.buf.definition)
  nnoremap("gD",        lsp.buf.declaration)
  nnoremap("gi",        lsp.buf.implementation)
  nnoremap("gr",        lsp.buf.references)
  nnoremap("gS",        lsp.buf.document_symbol)
  nnoremap("gt",        lsp.buf.type_definition)
  nnoremap("gw",        lsp.buf.workspace_symbol)

  -- Documentation
  inoremap("<C-k>",     lsp.buf.signature_help)
  nnoremap("<C-k>",     lsp.buf.signature_help)
  nnoremap("K",         lsp.buf.hover)

  -- Diagnostics
  nnoremap("[d",        lsp.diagnostic.goto_prev)
  nnoremap("]d",        lsp.diagnostic.goto_next)
  nnoremap("<space>d",  lsp.diagnostic.set_loclist)
  nnoremap("<space>e",  lsp.diagnostic.show_line_diagnostics)

  -- Refactoring
  nnoremap("<space>a",  lsp.buf.code_action)
  nnoremap("<space>f",  lsp.buf.formatting)
  nnoremap("<space>rn", lsp.buf.rename)

  -- Workspaces
  nnoremap("<space>wa", lsp.buf.add_workspace_folder)
  nnoremap("<space>wl", function() print(vim.inspect(lsp.buf.list_workspace_folders())) end)
  nnoremap("<space>wr", lsp.buf.remove_workspace_folder)
end

return mappings_nvim_lsp

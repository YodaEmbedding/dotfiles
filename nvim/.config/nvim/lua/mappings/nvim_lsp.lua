local mappings_nvim_lsp = {}

local vimp = require("vimp")

local inoremap = vimp.inoremap
local nnoremap = vimp.nnoremap
local lsp = vim.lsp

local function n_buffer(...)
  nnoremap({"buffer", "silent"}, ...)
end

local function n_silent(...)
  nnoremap({"buffer", "silent"}, ...)
end

local function i_buffer(...)
  inoremap({"buffer"}, ...)
end

function mappings_nvim_lsp.load()
  -- Navigation
  n_silent("gCi",       lsp.buf.incoming_calls)
  n_silent("gCo",       lsp.buf.outgoing_calls)
  n_silent("gd",        lsp.buf.definition)
  n_silent("gD",        lsp.buf.declaration)
  n_silent("g{",        lsp.buf.implementation)
  -- n_silent("gr",        lsp.buf.references)
  n_silent("gS",        lsp.buf.document_symbol)
  n_silent("gt",        lsp.buf.type_definition)
  n_silent("gw",        lsp.buf.workspace_symbol)

  -- Documentation
  i_buffer("<C-k>",     lsp.buf.signature_help)
  n_silent("<C-k>",     lsp.buf.signature_help)
  n_silent("K",         lsp.buf.hover)

  -- Diagnostics
  n_silent("[d",        lsp.diagnostic.goto_prev)
  n_silent("]d",        lsp.diagnostic.goto_next)
  n_silent("<space>l",  lsp.diagnostic.set_loclist)
  n_silent("<space>e",  lsp.diagnostic.show_line_diagnostics)

  -- Refactoring
  n_buffer("<space>a",  lsp.buf.code_action)
  n_buffer("<space>f",  lsp.buf.formatting)
  n_buffer("<space>rn", lsp.buf.rename)

  -- Workspaces
  n_buffer("<space>wa", lsp.buf.add_workspace_folder)
  n_buffer("<space>wl", function()
    print(vim.inspect(lsp.buf.list_workspace_folders()))
  end)
  n_buffer("<space>wr", lsp.buf.remove_workspace_folder)
end

return mappings_nvim_lsp

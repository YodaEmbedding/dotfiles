local _M = {}

local vimp = require("vimp")

local inoremap = vimp.inoremap
local nnoremap = vimp.nnoremap
local lsp = vim.lsp

local function n(...)
  nnoremap({ "buffer", "silent" }, ...)
end

local function i(...)
  inoremap({ "buffer", "silent" }, ...)
end

---@format disable-next
function _M.on_attach()
  -- Navigation
  n ("gCi",       lsp.buf.incoming_calls)
  n ("gCo",       lsp.buf.outgoing_calls)
  n ("gd",        lsp.buf.definition)
  n ("gD",        lsp.buf.declaration)
  n ("g{",        lsp.buf.implementation)
  -- n("gr",        lsp.buf.references)
  n ("gS",        lsp.buf.document_symbol)
  n ("gt",        lsp.buf.type_definition)
  n ("gw",        lsp.buf.workspace_symbol)

  -- Documentation
  i ("<C-k>",     lsp.buf.signature_help)
  n ("<C-k>",     lsp.buf.signature_help)
  n ("K",         lsp.buf.hover)

  -- Diagnostics
  n ("[d",        vim.diagnostic.goto_prev)
  n ("]d",        vim.diagnostic.goto_next)
  n ("<space>z",  vim.diagnostic.setloclist)
  n ("<space>e",  vim.diagnostic.open_float)

  -- Refactoring
  local ok, actions_preview = pcall(require, "actions-preview")
  n ("<space>a",  ok and actions_preview.code_actions or lsp.buf.code_action)
  n ("<space>F", lsp.buf.format)
  n ("<space>rn", lsp.buf.rename)

  -- Workspaces
  n ("<space>wa", lsp.buf.add_workspace_folder)
  n ("<space>wl", function()
    print(vim.inspect(lsp.buf.list_workspace_folders()))
  end)
  n ("<space>wr", lsp.buf.remove_workspace_folder)
end

return _M

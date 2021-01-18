local nvim_lsp = require("lspconfig")
local lspfuzzy = require("lspfuzzy")

local function on_attach(_client, _bufnr)
  print("LSP started.")

  -- require("completion").on_attach(client)

  -- vim.api.nvim_buf_set_option(_bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  require("mappings.nvim_lsp").load()
end

lspfuzzy.setup {}

-- local status, lsp_py = pcall(require, "_lsp_py")
-- if status then
--   nvim_lsp.py_custom.setup { on_attach = on_attach }
-- else
--   nvim_lsp.pyright.setup { on_attach = on_attach }
-- end

local servers = {
  "bashls",
  "ccls",
  "clojure_lsp",
  "cmake",
  "cssls",
  "hls",
  "html",
  "jdtls",
  "jsonls",
  "kotlin_language_server",
  "metals",
  "pyright",
  "rust_analyzer",
  "texlab",
  "tsserver",
  "vimls",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

-- vim.cmd "autocmd BufEnter * lua require('completion').on_attach()"

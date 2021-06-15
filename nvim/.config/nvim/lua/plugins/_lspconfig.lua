if not _G.plugin_loaded("nvim-lspconfig") then
  do return end
end

local nvim_lsp = require("lspconfig")

local function on_attach(client, bufnr)
  print("LSP started.")

  if _G.plugin_loaded("completion-nvim") then
    -- For completion-nvim:
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "")
    require("completion").on_attach(client)
  else
    -- For built-in LSP omnifunc:
    vim.api.nvim_buf_set_option(bufnr, "completefunc", "v:lua.vim.lsp.omnifunc")
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  end

  require("mappings.nvim_lsp").load()

  -- Hide latest message.
  print(" ")
end

-- local status, _ = pcall(require, "plugins._lspconfig_py")
-- local py_lsp = status and nvim_lsp.py_custom or nvim_lsp.pyright
-- py_lsp.setup { on_attach = on_attach }

local status, _ = pcall(require, "plugins._lspconfig_matlab")
if status then
  nvim_lsp.matlab.setup { on_attach = on_attach }
end

local status, setup = pcall(require, "plugins._lspconfig_sumneko")
if status then
  setup { on_attach = on_attach }
end

local status, setup = pcall(require, "plugins._lspconfig_diagnosticls")
if status then
  setup { on_attach = on_attach }
end

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
  -- "sumneko_lua",
  "texlab",
  "tsserver",
  "vimls",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

-- vim.cmd "autocmd BufEnter * lua require('completion').on_attach()"

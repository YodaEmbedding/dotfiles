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

  require("plugins._lspkind_nvim")
  require("plugins._lsp_signature_nvim")
  require("mappings._nvim_lsp").load()

  -- Hide latest message.
  print(" ")
end

local servers = {
  "bashls",
  "ccls",
  "clojure_lsp",
  "cmake",
  "cssls",
  "diagnosticls",
  "hls",
  "html",
  "jdtls",
  "jsonls",
  "kotlin_language_server",
  -- "matlab",
  "metals",
  -- "py_custom",
  -- "pyright",
  "rnix",
  "rust_analyzer",
  "sumneko_lua",
  "texlab",
  "tsserver",
  "vimls",
  "yamlls",
}

local configs = {
  diagnosticls = require("plugins.lspconfig.diagnosticls"),
  sumneko_lua = require("plugins.lspconfig.sumneko_lua"),
}

require("plugins.lspconfig.matlab")

local ok, _ = pcall(require, "plugins.lspconfig.py_custom")
table.insert(servers, ok and "py_custom" or "pyright")

local config_defaults = {}

local coq = nil
if _G.plugin_loaded("coq") then
  coq = require("coq")
end

require("plugins._nvim_cmp")

local cmp_nvim_lsp = nil
if _G.plugin_loaded("cmp-nvim-lsp") then
  cmp_nvim_lsp = require("cmp_nvim_lsp")
  config_defaults = vim.tbl_extend("error", config_defaults, {
    capabilities = cmp_nvim_lsp.update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    ),
  })
end

for _, lsp in ipairs(servers) do
  local config = configs[lsp] or {}
  config.on_attach = on_attach
  if coq ~= nil then
    config = coq.lsp_ensure_capabilities(config)
  end
  config = vim.tbl_extend("keep", config, config_defaults)
  nvim_lsp[lsp].setup(config)
end

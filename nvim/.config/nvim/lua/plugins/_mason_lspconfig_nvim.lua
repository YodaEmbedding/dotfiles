return {
  "williamboman/mason-lspconfig.nvim",

  dependencies = {
    "williamboman/mason.nvim",
  },

  config = function()
    require("mason-lspconfig").setup {
      ensure_installed = {
        "bashls",
        -- "ccls",
        "clojure_lsp",
        "cmake",
        "cssls",
        "diagnosticls",
        "efm",
        -- "hls",
        "html",
        "jdtls",
        "jsonls",
        "kotlin_language_server",
        "lua_ls",
        -- "metals",
        "pyright",
        "rnix",
        "rust_analyzer",
        "texlab",
        "tsserver",
        "vimls",
        "yamlls",
      },
    }
  end,
}

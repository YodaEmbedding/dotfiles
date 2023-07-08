return {
  "williamboman/mason-lspconfig.nvim",

  dependencies = {
    "williamboman/mason.nvim",
  },

  config = function()
    require("mason-lspconfig").setup {
      ensure_installed = {
        "bashls",
        -- "ccls",  -- not supported
        "cmake",
        "cssls",
        "diagnosticls",
        "efm",
        "html",
        "jsonls",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "texlab",
        "tsserver",
        "vimls",
        "yamlls",
        -- "clojure_lsp",
        -- "hls",
        -- "jdtls",
        -- "kotlin_language_server",
        -- "metals",
        -- "pylyzer",
        -- "rnix",
      },
    }
  end,
}

return {
  "williamboman/mason-lspconfig.nvim",

  dependencies = {
    "williamboman/mason.nvim",
  },

  event = { "BufReadPre", "BufNewFile" },

  opts = {
    ensure_installed = {
      "bashls",
      "efm",
      "lua_ls",
      "pyright",
      "ruff_lsp",
      "vimls",

      -- -- "ccls",  -- not supported
      -- "cmake",
      -- "cssls",
      -- "diagnosticls",
      -- "html",
      -- "jsonls",
      -- "rust_analyzer",
      -- "texlab",
      -- "tsserver",
      -- "yamlls",

      -- "clojure_lsp",
      -- "hls",
      -- "jdtls",
      -- "ltex",
      -- "kotlin_language_server",
      -- "metals",
      -- "pylyzer",
      -- "rnix",
    },
  },
}

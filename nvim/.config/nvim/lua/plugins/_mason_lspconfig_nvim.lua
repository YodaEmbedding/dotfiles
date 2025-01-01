return {
  "williamboman/mason-lspconfig.nvim",

  dependencies = {
    "williamboman/mason.nvim",
  },

  event = { "BufReadPre", "BufNewFile" },

  opts = {
    ensure_installed = {
      "basedpyright",
      "bashls",
      "efm",
      "lua_ls",
      "ruff",
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

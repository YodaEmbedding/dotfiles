return {
  "williamboman/mason-lspconfig.nvim",

  dependencies = {
    "williamboman/mason.nvim",
  },

  event = { "BufReadPre", "BufNewFile" },

  opts = {
    automatic_enable = false,
    ensure_installed = {
      "basedpyright",
      "bashls",
      "lua_ls",
      "ruff",
      "vimls",

      -- Generic:
      -- "ast_grep",
      "efm",

      -- Language/spell/grammar:
      -- "harper_ls",
      -- "textlsp",
      -- "vale_ls",

      -- Text:
      -- "markdown_oxide",
      -- "marksman",
      -- "texlab",

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

return {
  "stevearc/conform.nvim",

  opts = {
    default_format_opts = {
      lsp_format = "fallback",
    },
    -- NOTE: These can also be configured through the efm language server.
    -- In fact, if lsp_format = "prefer", some of these may be ignored.
    formatters_by_ft = {
      bash = { "shfmt" },
      sh = { "shfmt" },
      zsh = { "shfmt" },

      html = { "prettierd" },

      css = { "prettierd" },
      scss = { "prettierd" },
      less = { "prettierd" },
      sass = { "prettierd" },

      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      vue = { "prettierd" },

      json = { "fixjson", "prettierd" },
      jsonc = { "prettierd" },
      graphql = { "prettierd" },
      yaml = { "prettierd" },

      -- lua = { "stylua" },

      markdown = { "mdformat" },

      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },

      rust = { "rustfmt", lsp_format = "fallback" },
    },
  },

  config = function(_, opts)
    require("conform").setup(opts)
  end,
}

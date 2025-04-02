local eslint = require("efmls-configs.linters.eslint_d")
local fixjson = require("efmls-configs.linters.fixjson")
local stylelint = require("efmls-configs.linters.stylelint")

local clang_format = require("efmls-configs.formatters.clang_format")
local prettier = require("efmls-configs.formatters.prettier_d")
local shfmt = require("efmls-configs.formatters.shfmt")

local languages = vim.tbl_extend(
  "force",
  require("efmls-configs.defaults").languages(),
  -- Custom overrides:
  {
    bash = { shfmt },
    sh = { shfmt },
    zsh = { shfmt },

    c = { clang_format },
    cpp = { clang_format },

    html = { prettier },

    css = { stylelint, prettier },
    scss = { stylelint, prettier },
    less = { stylelint, prettier },
    sass = { stylelint, prettier },

    javascript = { eslint, prettier },
    javascriptreact = { eslint, prettier },
    typescript = { eslint, prettier },
    typescriptreact = { eslint, prettier },
    vue = { prettier },

    json = { fixjson, prettier },
    jsonc = { prettier },
    graphql = { prettier },
    yaml = { prettier },

    markdown = { require("efmls-configs.formatters.mdformat") },

    python = {
      require("efmls-configs.linters.ruff"),
      require("efmls-configs.formatters.ruff"),
      require("efmls-configs.formatters.ruff_sort"),
    },

    rust = { require("efmls-configs.formatters.rustfmt") },
  }
)

-- lua_ls already has a built-in formatter.
languages.lua = nil

return {
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
  filetypes = vim.tbl_keys(languages),
  single_file_support = true,
  settings = {
    rootMarkers = { ".git/" },
    languages = languages,
  },
}

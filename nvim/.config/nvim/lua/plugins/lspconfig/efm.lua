return {
  init_options = {
    codeAction = true,
    documentFormatting = true,
  },
  filetypes = { "python" },
  -- filetypes = { "lua", "python" },
  single_file_support = true,
  settings = {
    -- rootMarkers = {".git/"},
    languages = {
      lua = {
        -- { formatCommand = "lua-format -i", formatStdin = true },
      },
      python = {
        { formatCommand = "isort --quiet -", formatStdin = true },
        { formatCommand = "black --quiet -", formatStdin = true },

        -- {
        --   lintCommand = "mypy --show-column-numbers",
        --   lintFormats = {
        --     '%f:%l:%c: %trror: %m',
        --     '%f:%l:%c: %tarning: %m',
        --     '%f:%l:%c: %tote: %m',
        --   },
        --   -- formatStdin = true,
        -- },

      },
    },
  },
}
